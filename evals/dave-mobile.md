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
