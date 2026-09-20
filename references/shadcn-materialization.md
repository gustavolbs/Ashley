# shadcn/ui Materialization

Use this when the project uses shadcn/ui or the user asks to recreate shadcn components in the design canvas.

## Never rely on memory for the catalog

shadcn evolves.

Determine the current contract from:
1. the project's `components.json` when present;
2. actual installed component source files;
3. the current shadcn CLI/registry/docs when upstream coverage is requested.

The project may use Radix, Base UI or another base. Do not assume.

## Scope: installed project vs full upstream

Clarify internally from the request:

### Project-installed library
Mirror what the repository actually uses/contains.

This is normally the most useful design-system source.

### Full current shadcn catalog
If the user explicitly wants upstream coverage, query the current registry rather than inventing names.

Useful current CLI patterns include:
```bash
npx shadcn@latest info
npx shadcn@latest search @shadcn --limit 100
npx shadcn@latest view button card dialog
npx shadcn@latest docs combobox
```

Use current CLI help/docs if exact commands differ.

Do not install components into the product merely to inspect them unless the user asks. Prefer read/view/docs operations.

## Project discovery

Inspect:
- `components.json`;
- configured aliases;
- component base/style;
- CSS variables/theme;
- `components/ui` or resolved UI alias;
- variants defined with CVA or equivalent;
- Lucide/other icon usage;
- local modifications to upstream components.

Local code wins over generic upstream appearance.

## Token translation

Translate the project's actual semantic variables into design variables.

Typical roles may include:
- background;
- foreground;
- card;
- popover;
- primary;
- secondary;
- muted;
- accent;
- destructive;
- border;
- input;
- ring;
- chart-*.

Do not assume their values.

Preserve the project's custom palette and typography.

## Suggested families

Organize by dependency rather than alphabetically:

### Foundations / primitives
Button, Badge, Separator, Skeleton, Avatar.

### Inputs
Input, Textarea, Label, Checkbox, Radio Group, Switch, Slider, Select.

### Feedback
Alert, Progress, Sonner/Toast, Spinner where present.

### Disclosure / navigation
Accordion, Tabs, Breadcrumb, Pagination, Navigation Menu, Menubar, Sidebar where present.

### Overlays
Dialog, Alert Dialog, Sheet, Drawer, Popover, Hover Card, Tooltip, Dropdown Menu, Context Menu, Command.

### Data / content
Card, Table, Calendar, Chart, Carousel, Scroll Area, Aspect Ratio.

### Complex/composed
Form patterns, Combobox, Date Picker and project-specific compositions.

This is only an ordering aid. The actual manifest comes from code/registry evidence.

## Variants and states

Mirror actual supported variants.

Example for Button: do not invent a variant list; read the implementation/registry item.

Represent at minimum the states that materially affect visual design:
- default;
- hover;
- focus-visible;
- active/pressed where relevant;
- disabled;
- invalid/error where relevant;
- selected/checked/open where relevant;
- loading only if the product contract includes it.

## pen.dev target

Prefer:
```text
design/
├── ui.lib.pen
└── ui-catalog.pen
```

The `.lib.pen` contains origins/variables.
The catalog shows labeled specimens.

Use reusable components, refs/instances and slots—not flattened lookalikes.

## QA

After every small family:
- screenshot at useful zoom;
- inspect spacing/type/color/state legibility;
- compare against actual project implementation/browser when available;
- fix before continuing.

For an existing product, browser-rendered components are valuable reference truth for visual parity.
