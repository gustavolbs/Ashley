#!/usr/bin/env node
import { spawnSync } from "node:child_process";
import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import path from "node:path";
import process from "node:process";
import { fileURLToPath } from "node:url";

const HERE = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(HERE, "..");
const CASE_FILE = path.join(HERE, "behavior-cases.json");
const SCHEMA = path.join(HERE, "behavior.schema.json");
const ARTIFACTS = path.join(HERE, "artifacts");
const cases = JSON.parse(readFileSync(CASE_FILE, "utf8")).cases;

function validateCases() {
  const ids = new Set();
  const personas = new Set(["laila","roberto","clara","ana","ashley","dave","guto"]);
  const modes = new Set(["FAST","STANDARD","HIGH_RISK"]);
  for (const c of cases) {
    if (!c.id || ids.has(c.id)) throw new Error(`invalid or duplicate case id: ${c.id}`);
    ids.add(c.id);
    if (!c.prompt) throw new Error(`missing prompt: ${c.id}`);
    if (!personas.has(c.expect?.selected_persona)) throw new Error(`invalid persona: ${c.id}`);
    if (!modes.has(c.expect?.execution_mode)) throw new Error(`invalid execution mode: ${c.id}`);
  }
}

function parseJsonl(text) {
  return text.split("\n").filter(Boolean).map((line) => JSON.parse(line));
}

function metrics(events) {
  let commands = 0;
  let inputTokens = 0;
  let outputTokens = 0;
  for (const e of events) {
    if (e.type === "item.completed" && e.item?.type === "command_execution") commands += 1;
    if (e.type === "turn.completed" && e.usage) {
      inputTokens += e.usage.input_tokens ?? 0;
      outputTokens += e.usage.output_tokens ?? 0;
    }
  }
  return { command_executions: commands, input_tokens: inputTokens, output_tokens: outputTokens };
}

function assertExpected(actual, expected, id) {
  const errors = [];
  for (const [key, value] of Object.entries(expected)) {
    if (actual[key] !== value) errors.push(`${key}: expected ${JSON.stringify(value)}, got ${JSON.stringify(actual[key])}`);
  }
  if (errors.length) throw new Error(`${id}: ${errors.join("; ")}`);
}

function runCase(c) {
  mkdirSync(ARTIFACTS, { recursive: true });
  const tracePath = path.join(ARTIFACTS, `${c.id}.jsonl`);
  const resultPath = path.join(ARTIFACTS, `${c.id}.result.json`);
  const prompt = [
    "AI PERSONAS BEHAVIOR EVAL. Do not modify files and do not execute the requested work.",
    "Classify how the installed AI Personas suite should route this request.",
    "Return only the structured routing decision required by the output schema.",
    "Choose the single-domain owner directly; use Laila only when the outcome is materially cross-functional or explicitly delivery/program coordination.",
    "",
    `REQUEST: ${c.prompt}`,
  ].join("\n");

  const res = spawnSync("codex", [
    "exec",
    "--json",
    prompt,
    "--output-schema", SCHEMA,
    "-o", resultPath,
  ], { cwd: ROOT, encoding: "utf8" });

  writeFileSync(tracePath, res.stdout ?? "", "utf8");
  if (res.status !== 0) throw new Error(`${c.id}: codex exited ${res.status}: ${res.stderr ?? ""}`);

  const actual = JSON.parse(readFileSync(resultPath, "utf8"));
  assertExpected(actual, c.expect, c.id);

  const m = metrics(parseJsonl(readFileSync(tracePath, "utf8")));
  if (c.max_command_executions != null && m.command_executions > c.max_command_executions) {
    throw new Error(`${c.id}: command executions ${m.command_executions} > ${c.max_command_executions}`);
  }
  return { id: c.id, pass: true, ...m, routing: actual };
}

validateCases();

const args = process.argv.slice(2);
const live = args.includes("--live");
const all = args.includes("--all");
const caseArg = args.find((x) => x.startsWith("--case="));
const caseId = caseArg ? caseArg.slice("--case=".length) : null;

if (!live) {
  console.log(`Behavior eval manifest valid: ${cases.length} cases. Use --live to execute Codex.`);
  process.exit(0);
}

if (!existsSync(SCHEMA)) throw new Error("missing behavior schema");
const probe = spawnSync("codex", ["--version"], { encoding: "utf8" });
if (probe.status !== 0) throw new Error("codex CLI not available");

const selected = caseId
  ? cases.filter((c) => c.id === caseId)
  : all
    ? cases
    : cases.slice(0, 3);

if (!selected.length) throw new Error("no matching eval cases");

const summary = [];
for (const c of selected) {
  const result = runCase(c);
  summary.push(result);
  console.log(JSON.stringify(result));
}

mkdirSync(ARTIFACTS, { recursive: true });
writeFileSync(path.join(ARTIFACTS, "latest-summary.json"), JSON.stringify(summary, null, 2) + "\n");
