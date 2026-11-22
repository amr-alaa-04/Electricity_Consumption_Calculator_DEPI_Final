# Codex Project Handoff

Snapshot date: 2026-11-22  
Project: Electricity Consumption Calculator  
Repository root: `D:\StudioProjects\Electricity_Calculator_Git`

This handoff records the state observed in the working tree on the snapshot date. It is intended to let a new Codex account continue without repeating the prior screen, design-token, and reusable-component reviews. The working tree contains uncommitted work; preserve it and inspect its diffs before making decisions about cleanup.

## 1. Project overview and architecture

The project is a Flutter app for tracking household electricity consumption and estimated costs in Egypt. The product targets Arabic/RTL and English/LTR users. The project instructions require preserving existing conventions, using feature-first Clean Architecture where useful, and avoiding unnecessary layers and dependencies.

Current foundation includes:

- Flutter and Dart, with SDK constraint `^3.12.2` in `pubspec.yaml`.
- Riverpod (`flutter_riverpod`) for app-level dependency composition.
- GoRouter for navigation.
- Dio and shared infrastructure for networking, configuration, logging, and secure key/value storage. No screen API or backend behavior is implemented for the onboarding UI.
- Flutter localization generated from four ARB source files. English and Arabic locales are supported, including US English and Egyptian Arabic variants.
- A Material 3 `ThemeData` built from the project's own color, typography, shape, and spacing tokens.
- Bundled IBM Plex Sans Latin and Arabic fonts in four weights each.

Main code areas:

- `lib/main.dart`: entry point, framework/platform/zone error handlers, and `ProviderScope` launch.
- `lib/app/`: app composition and GoRouter setup.
- `lib/core/`: configuration, logging, networking, storage, theme, and shared controls.
- `lib/features/onboarding/presentation/`: the first onboarding screen, its local visual helpers, and a second-step placeholder.
- `lib/l10n/`: localization source files and generated Dart localization classes.
- `test/`: app/widget and design-system tests.

The current app is still early-stage: beyond the first onboarding screen and its destination placeholder, the other supplied screens have no Flutter UI implementation.

## 2. Git repository, branch, and commits

At inspection:

- Current branch: `phase-3-screens-ui`.
- HEAD: `9a56af7` (2026-11-21), merge commit `Merge pull request #2 from amr-alaa-04/phase-1-foundation-design-system-components`.
- `phase-3-screens-ui`, local `main`, `origin/main`, and `origin/HEAD` all pointed to `9a56af7` at inspection.
- No Phase 3 screen work was committed yet; it is represented by working-tree changes.

Recent commits, newest first:

1. `9a56af7` — merge foundation/design system/components PR.
2. `644e876` — `Add app foundation and reusable design components`.
3. `523c49c` — merge documentation update PR.
4. `cee2856` — `Adding Documentation`.
5. `b3bc335` — `First commit`.

Do not assume the current uncommitted files belong to the base commit. The user explicitly asked to preserve existing working-tree changes during screen implementation and debugging.

## 3. Completed phases and implemented features

The user marked these phases complete and approved:

1. Phase 1: Project Foundation.
2. Phase 2.1: Design System.
3. Phase 2.2.1: Buttons & Inputs.

Phase 3 is in progress. The first onboarding screen was implemented:

- `02_onboarding_track_your_electricity`: implemented in Flutter with localized copy, RTL/LTR support, scrollable responsive content, meter/scanner illustration, sample reading and tier details, feature cards, progress indicator, disabled Skip affordance, and Next button.
- Next navigates to `/onboarding/calculate-your-bill`, which renders a minimal placeholder. The second onboarding screen's actual design is not implemented.
- No OCR, camera capture, voice recognition, backend, authentication, or bill calculations were implemented.
- No dependencies were added for that screen work; `pubspec.yaml` currently contains the foundation dependencies and bundled font declarations.

The user has not yet approved the first implemented screen after the requested review/audit. The explicit stopping instruction from implementation remains in force: **stop at this screen and wait for review/approval; do not start another screen.**

## 4. Current project state and relevant paths

### App composition and routing

- `lib/main.dart` — `runZonedGuarded` and error forwarding. `WidgetsFlutterBinding.ensureInitialized()` and `runApp()` now both execute inside the same guarded zone. This was the minimal fix for the reported Zone mismatch; existing Flutter, platform, and asynchronous error handlers were retained.
- `lib/app/app.dart` — `MaterialApp.router`, app theme, localization delegates/locales, and Riverpod router provider.
- `lib/app/app_router.dart` — initial route points to the first onboarding screen; `/` redirects there; Next's route points to the second-step placeholder.

### Theme and existing shared widgets

- `lib/core/theme/app_colors.dart` — Material color roles plus semantic success/warning colors.
- `lib/core/theme/app_typography.dart` — IBM Plex type scale, Latin/Arabic font fallback, mobile display styles, and tabular currency figures.
- `lib/core/theme/app_shape_tokens.dart` — radius and spacing constants.
- `lib/core/theme/app_theme.dart` — applies the theme and shared button styling.
- `lib/core/widgets/buttons/app_button.dart` — configurable primary, secondary, outlined, and text buttons.
- `lib/core/widgets/buttons/app_icon_button.dart` — icon action button with tooltip and styling options.
- `lib/core/widgets/inputs/app_text_field.dart`, `app_search_field.dart`, `app_password_field.dart`, `app_number_field.dart`, `app_dropdown_field.dart`, `app_email_field.dart`, and `app_input_decoration.dart` — reusable input family and shared decoration.
- `lib/core/config/app_environment.dart`, `lib/core/logging/app_logger.dart`, `lib/core/network/api_client.dart`, `lib/core/storage/secure_key_value_store.dart` — existing infrastructure; not part of onboarding visual logic.

### Onboarding implementation

- `lib/features/onboarding/presentation/onboarding_track_electricity_screen.dart` — screen composition and screen-specific visuals.
- `lib/features/onboarding/presentation/onboarding_step_indicator.dart` — onboarding step dots/indicator.
- `lib/features/onboarding/presentation/onboarding_status_dot.dart` — scanner status indicator.
- `lib/features/onboarding/presentation/onboarding_scanner_corners.dart` and `onboarding_scanner_corner.dart` — decorative scan frame corners.
- `lib/features/onboarding/presentation/inline_icon_label.dart` — small icon-and-label row used by this screen.
- `lib/features/onboarding/presentation/onboarding_calculate_bill_placeholder.dart` — route target placeholder only.

### Localization and tests

- Localization sources: `lib/l10n/app_en.arb`, `app_en_US.arb`, `app_ar.arb`, `app_ar_EG.arb`.
- Generated outputs: `lib/l10n/generated/app_localizations.dart`, `app_localizations_en.dart`, `app_localizations_ar.dart`. These should be regenerated from ARB changes using Flutter's localization generation; do not hand-edit generated outputs unless project tooling requires it.
- Tests: `test/widget_test.dart`, `test/design_system_test.dart`, `test/core/widgets/app_components_test.dart`.

### Design and requirements references

- SRS: `Project Documentation/SRS_Final.pdf` (read-only; do not modify).
- All supplied screen references: `Project Documentation/stitch_egypt_energy_tracker_calculator/`.
- First screen design: `02_onboarding_track_your_electricity/code.html` and `screen.png`.
- Second screen reference (destination only; do not implement yet): `03_onboarding_calculate_your_bill/code.html` and `screen.png`.
- Other references, not yet implemented: `04_onboarding_budget_energy_saving`, `06_welcome_login`, `10_main_home_dashboard`, `14_add_reading`, `19_bill_breakdown_progressive_tariffs`, `22_analytics_appliance_breakdown`, `29_appliances_management`, and `37_settings_preferences` (each has `code.html` and `screen.png`).
- Logo reference: `electricity_calculator_logo/screen.png`.
- Design token and brand guide: `nile_watt_financial/DESIGN.md`.

## 5. Approved decisions and requirements

- Work on screens one at a time; each screen needs review and approval before starting another.
- The only screen implemented for Phase 3 so far is onboarding screen 02. Its Next destination may exist as a minimum placeholder, but screen 03 must not receive its design/UI before approval.
- No implementation of onboarding screen 04, Welcome, Login, Register, backend, Firebase, authentication, OCR, voice recognition, or business calculations is authorized by the screen-02 task.
- Preserve the current branch and all existing uncommitted changes. Do not reset, restore, stash, or otherwise discard them.
- Do not add dependencies or modify the SRS/design HTML references without explicit authorization.
- The approved concrete visual source of truth is the HTML references as represented by the existing Flutter token files. `AppColors`, `AppTypography`, `AppShapeTokens`, and `AppSpacing` are the Flutter token locations; no token values have been changed in response to the audit.
- The recent authorized `DESIGN.md` change reconciled its descriptive color guidance with its unchanged YAML palette. It did not authorize changes to typography, shape, spacing, or other token guidance.
- Maintain the app's Arabic RTL and English LTR behavior and use the existing localization system.
- Do not implement cross-screen abstractions merely because two elements look alike; share only where their behavior and visual responsibility truly match.

## 6. Design token audit and approved recommendation

The detailed audit found that the 10 HTML references repeat the palette used in `AppColors`, while the prose color section of `DESIGN.md` had competing values. The YAML palette in `DESIGN.md` already matched the HTML and was explicitly not to be changed.

Notable values now aligned in `DESIGN.md` prose:

- Primary `#004131`; primary container `#145A46`.
- Secondary `#006C53`; secondary container `#9AF4D4`.
- Main text `#111E19`; secondary text `#404944`; outline `#707974`.
- Canvas `#EDFDF3`; error `#BA1A1A`; success `#2E9D69`; warning `#E6A23C`.

Other audit findings still matter for future UI work:

- Typography size/weight/line-height scales broadly agree across HTML and Flutter tokens, but HTML font-family stacks vary by screen (some Arabic-only, some Latin-only, some bilingual). Do not silently alter the typography tokens; this remains a separate decision.
- Spacing values broadly match. Shape radius values match numerically, but Tailwind radius token names in HTML and `DESIGN.md` do not map consistently by name.
- HTML screens use different maximum content widths and several screen-specific shadows; not every dimension/effect should be promoted to a universal token.
- The audit was analysis-only: no reusable component system was implemented or approved as a blanket refactor.

## 7. Reusable component audit findings

Existing reusable components to inspect/reuse before adding new ones:

- `AppButton` and `AppIconButton` under `lib/core/widgets/buttons/`.
- Input controls and decoration under `lib/core/widgets/inputs/`.
- Shared visual tokens under `lib/core/theme/`.

Current onboarding helpers are feature-specific, not proven general-purpose components. `OnboardingScannerCorners` may share its low-level frame drawing with the add-reading scanner in the future, but the whole scanner preview should remain feature-specific because its purpose and behavior differ. `OnboardingStepIndicator`, `OnboardingStatusDot`, and `InlineIconLabel` are currently onboarding-local.

Patterns proposed for future evaluation—not implemented yet—include:

- Bottom navigation shared among dashboard, add-reading, bill breakdown, analytics, appliances, and settings screens.
- A common page header/brand lockup, surface/card shell, status badge, notice banner, segmented control, metric value/icon tile, and chart container where repeated screens truly share the same behavior and styling.
- Onboarding progress/feature presentation shared among the onboarding sequence only.
- Keep tariff breakdown rows, appliance-specific cards, scanner preview composition, and screen-specific chart visuals inside their feature unless concrete repetition demonstrates a useful shared abstraction.

Recommended direction when approved: put genuinely app-wide components under `lib/core/widgets/` (possibly grouped by buttons, navigation, feedback, surfaces, and data display); keep onboarding-only widgets under `lib/features/onboarding/presentation/widgets/` or nearby feature presentation files. Do not reorganize existing code without approval and a concrete need.

## 8. Known issues and pending decisions

1. **Screen-02 approval is pending.** The user asked for a comprehensive review and then a project-wide reusable component audit, but has not explicitly approved the screen implementation or requested fixes. Resume by presenting the current state and wait for review/approval before moving on.
2. **Screen-03 is a placeholder.** It exists solely so screen-02 Next has a destination. It is not an implementation of the screen-03 design.
3. **Skip behavior needs confirmation against final onboarding flow.** The current Skip affordance is disabled. The screen references show Skip, but a definitive target/flow was not approved.
4. **Progress count needs confirmation.** The first screen shows step 1 of 4. Three onboarding designs are present (02, 03, 04), followed by a welcome/login reference (06); identify what the fourth onboarding step represents before changing the indicator.
5. **Sample/demo data:** the visual uses a sample reading (`14,892`), OCR/status and accuracy copy, and an illustrative tariff/tier example. These are static UI only. The English localization includes an EgyptERA tariff disclaimer. Do not turn these into claims or business calculations without requirement confirmation.
6. **Design-reference typography stacks differ.** This was not changed as the user explicitly deferred typography and other tokens.
7. **Working-tree provenance is mixed/unknown.** At inspection, Git reported changes to `DESIGN.md`, `lib/app/app_router.dart`, four ARB files, three generated localization files, `lib/main.dart`, two tests, and Linux/macOS/Windows generated plugin registrant files, plus an untracked `lib/features/` tree. These are all uncommitted. The onboarding-related changes correspond to prior work; generated platform plugin files also show working-tree status, but their origin should be checked from their diffs/tooling history before treating them as disposable. **Do not clean them up.**
8. `README.md` is still the default Flutter starter README and does not describe the application.
9. Test files exist for design tokens, components, app startup, route navigation, and a narrow Arabic viewport. This handoff inspection did not rerun `flutter analyze` or `flutter test`; use the last implementation-task result if available, or rerun them when the user authorizes/requests verification.

## 9. Exact stopping point and next recommended action

**Latest stopping point:** the screen-02 implementation and Next route to the screen-03 placeholder are present in the uncommitted working tree; the Zone mismatch fix is present in `lib/main.dart`; the approved HTML/token source-of-truth decision has been applied to color prose in `DESIGN.md`. The user has now requested and received this handoff. No second screen has been implemented.

**Next recommended action:** in the new Codex account, read this handoff, inspect `git status` and the screen-02 diff without modifying or discarding anything, then ask the user to review/approve screen 02. Make only approved screen-02 corrections. Do not implement screen 03 or the reusable component proposal until the user explicitly approves that next scope.

## 10. Working instructions and preferences

- Communicate plainly; the user has asked for Arabic explanations in some earlier reviews and English in others. Match the language of the latest request.
- Inspect current files and working-tree changes before implementation; do not rely on prior assumptions if the repository has moved.
- Preserve conventions, completed work, and unrelated user changes. Avoid broad rewrites, needless abstractions, dependencies, or generated-file churn.
- Keep each screen incremental and reviewable. Stop after the authorized screen and wait for approval.
- When a task is analysis-only, do not edit files. When authorized to edit a specific document or screen, keep the change within that scope.
- Do not change the SRS or design-reference files. Do not perform external/irreversible actions such as pushing, merging, deploying, or publishing without explicit authorization.
- Be transparent about what was verified, what was not rerun, and any uncertainty in the origin of existing modifications.
