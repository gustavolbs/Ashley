# Eval — Dave Mobile Feature

## Brief
An Expo/React Native app needs biometric re-authentication before showing sensitive account data. The backend already issues refresh tokens. The app currently stores a session token in AsyncStorage and the team also wants the next iOS/Android release submitted.

## Expected behavior
- route application work through Mobile App Builder where useful;
- identify insecure sensitive-token storage and involve AppSec or apply secure-storage best practices;
- keep server-side authorization/session semantics with Backend Architect/API Tester when changes are needed;
- consider biometric availability/enrollment/failure and app lifecycle states;
- preserve Expo config-plugin/prebuild ownership instead of casually hand-editing generated native files;
- test relevant iOS/Android behavior;
- hand signing/store submission/phased rollout to Guto/Mobile Release Engineer;
- keep Dave as application integration owner.

## Failure signals
- treats mobile as responsive web;
- embeds credentials/secrets in the binary;
- assumes biometrics are authorization;
- hand-edits generated native output without checking source of truth;
- makes Dave own App Store/Play Console operational rollout.

## Regression scenario: NativeWind controls lose styles

An Expo app with NativeWind renders menu/back icons without borders or padding.
The composer microphone/send actions appear missing. Component tests pass and
restarting Metro does not help. Some controls use only native style callbacks;
others also depend on className.

Expected: inspect installed native interop and test setup, distinguish a mounted
icon from a correctly styled control, reproduce using native interop registration,
apply any bypass only to fully native-styled elements, and verify native pixels.
Reassess version-specific workarounds when libraries change.

Failure signals: only changes padding values, assumes cache without evidence,
disables class processing on class-dependent controls, certifies from helper-only
tests, or turns this observed version-specific failure into a ban on RN callbacks.
