<!--
SYNC IMPACT REPORT
==================
Version Change: Template Scaffold -> 1.0.0 (Initial Ratification)
Modified Principles:
  - Replaced [PRINCIPLE_1_NAME] -> I. Purpose and Scope
  - Replaced [PRINCIPLE_2_NAME] -> II. Absolute Privacy (Non-Negotiable)
  - Replaced [PRINCIPLE_3_NAME] -> III. Local-First Data and Offline Resilience
  - Replaced [PRINCIPLE_4_NAME] -> IV. Reliable AI Extraction and Evaluation
  - Replaced [PRINCIPLE_5_NAME] -> V. Resilient Reminders and Permissions
Added Principles:
  - VI. Template-Driven Architecture and Layer Boundaries
  - VII. Code Quality, Testing, and Dependency Hygiene
  - VIII. Universal Localization and Accessibility
  - IX. Branching and Git Workflow
  - X. Spec-Driven Lifecycle
  - XI. Understood and Explainable Code
Added Sections:
  - Additional Security & Data Constraints
  - Quality Gates & Verification Standards
Removed Sections:
  - Generic placeholder sections [SECTION_2_NAME] and [SECTION_3_NAME] replaced with concrete domain standards.
Deferred Items / TODOs:
  - None. All placeholders fully resolved.
-->

# Gotit Constitution

## Core Principles

### I. Purpose and Scope
Gotit is an automation-first task application: the user shares text or a screenshot from another app, AI extracts a structured task, and the user confirms it in one tap.
- Every feature MUST trace directly to a stated requirement in the [Gotit Product Requirements Document (PRD)](../../docs/prd.md) for the version currently being built.
- Work outside the current version’s scope—such as background reading of chats or notifications, calendar sync, or team lists—MUST NOT be started until the PRD is formally amended.
- When a specification or requirement is ambiguous, the smaller, simpler solution that satisfies the requirement wins (YAGNI).

### II. Absolute Privacy (Non-Negotiable)
User privacy is foundational and inviolable:
- Only text that the user explicitly shares MAY be transmitted for AI extraction.
- Images MUST be converted to text locally on the device (on-device OCR) and MUST NEVER be uploaded to external servers or cloud services.
- The backend MUST NOT store raw shared text; it may persist only the structured tasks the user explicitly reviews and saves.
- Shared message content MUST NEVER appear in application logs, analytics events, crash reports, or user-facing error messages.
- The LLM API key MUST reside exclusively as a server-side secret and MUST NEVER ship within the client application.
- Every database table MUST enforce PostgreSQL Row Level Security (RLS) ensuring users can only read or write their own rows.
- Deleting a user account MUST trigger a complete purge of all cloud data associated with that user.

### III. Local-First Data and Offline Resilience
The client application is designed to be fully operational without an internet connection:
- The local Drift database is the authoritative source of truth. The UI MUST read exclusively from local storage and NEVER directly from the network.
- Synchronization to Supabase MUST run in the background using last-write-wins conflict resolution governed by update timestamps and soft deletes.
- Task extraction is the ONLY feature that requires an active network connection.
- When network extraction fails or is unavailable, the application MUST fall back to a prefilled manual task entry form so the user never loses shared content.

### IV. Reliable AI Extraction and Evaluation
AI extraction turns unstructured user input into actionable tasks with predictable reliability:
- Extraction responses MUST conform strictly to the defined task JSON schema, validated first on the server and verified again on the client before display.
- The model MUST NEVER guess or hallucinate dates; when a date is not present in the source text, the date field MUST remain `null`.
- Relative dates and times in both English and Arabic MUST resolve against the device’s current date, time, timezone, and locale.
- Malformed model output receives exactly one automatic retry; if it fails again, the system MUST gracefully fall back to the manual entry form.
- Every prompt or model revision MUST be benchmarked against the repository's evaluation set, with per-field accuracy metrics recorded in version control.

### V. Resilient Reminders and Permissions
Reminders keep users on track and must be dependable:
- All reminder scheduling logic MUST be encapsulated in a single, dedicated service covered by unit tests.
- Scheduled reminders MUST survive device reboots and application updates.
- Reminders MUST be rescheduled immediately whenever a task is edited, rescheduled, or marked complete.
- Reminder dispatch MUST degrade gracefully when exact alarm permissions are restricted or denied by the operating system.
- Every runtime permission (e.g., notifications, exact alarms) MUST be clearly explained to the user before triggering the OS permission prompt.

### VI. Template-Driven Architecture and Layer Boundaries
Gotit is built upon the `flutter_starter` template foundation:
- The template's directory structure, design tokens, core utilities, shared widgets, and dependencies form the foundation that all feature code extends.
- Every feature MUST reside in `lib/features/<feature_name>/` structured into `data/` (models, datasources, repositories), `cubit/` (or `bloc/`), and `ui/`. A separate domain layer is explicitly prohibited.
- Cubits/Blocs MUST depend exclusively on repository interfaces (`data/repositories/<feature>_repository.dart`), NEVER on concrete implementations, data sources, or transport packages directly.
- Feature states MUST follow the template standard: a single Freezed class holding a `LoadStatus` status enum, feature data, and an optional `Failure`. Freezed MUST NOT be used for Drift's generated database entities.
- Application navigation MUST use the centralized `app_router`.
- UI widgets MUST remain thin, containing no business logic or direct repository/DI imports.
- Native Android/Kotlin code (such as share targets and home-screen widgets) MUST be accessed strictly through Flutter platform channels with typed, documented contracts.
- The template’s `AGENTS.md` is the canonical AI configuration and references this constitution.

### VII. Code Quality, Testing, and Dependency Hygiene
Code quality is enforced systematically before any code reaches production:
- Unit tests are mandatory and MUST exist for: English and Arabic relative date resolution, JSON schema validation, sync conflict resolution, and reminder scheduling before a feature is considered done.
- `flutter analyze` and the full test suite MUST pass with zero errors, warnings, or lints before any merge.
- Any new dependency MUST include a one-line justification in the feature implementation plan; fewer, well-maintained packages are strictly preferred.
- Secrets, credentials, private keys, and environment tokens MUST NEVER be committed to source control.

### VIII. Universal Localization and Accessibility
Gotit is built from day one for global and accessible use:
- All user-facing strings MUST be localized in both English and Arabic (`l10n/app_en.arb` and `l10n/app_ar.arb`) with full Right-to-Left (RTL) layout support. Hardcoded user-facing strings are strictly forbidden.
- Light and Dark Material 3 themes MUST both be fully supported using centralized design tokens (`AppColors`, `AppSpacing`, `AppTypography`).
- Typography and layouts MUST adapt smoothly to system text scaling without clipping or overflow.
- All interactive UI elements MUST provide clear screen reader labels and maintain a minimum touch target size of 48x48 logical pixels.

### IX. Branching and Git Workflow
Version control practices guarantee continuous stability and clear lineage:
- The `main` branch MUST remain deployable, buildable, and passing all automated checks at all times.
- Each feature MUST be developed on its own isolated branch (e.g., `feat/<name>` or `app-init`) and merged only when all associated tasks are complete and checks pass.
- Commits MUST be atomic, scoped per task, and follow Conventional Commits (e.g., `feat:`, `fix:`, `refactor:`, `test:`, `docs:`), with commit messages explaining the rationale (*why*), not just the action (*what*).
- All changes MUST be merged via Pull Requests reviewed against the specification and this constitution, even when developing solo.
- Releases MUST be tagged with semantic version tags.
- Generated files and environment secrets MUST be excluded via `.gitignore` and never committed inadvertently.

### X. Spec-Driven Lifecycle
All feature development adheres to the structured Spec Kit lifecycle:
- Development strictly follows the sequence: Specify (`/speckit-specify`) -> Plan (`/speckit-plan`) -> Tasks (`/speckit-tasks`) -> Implement (`/speckit-implement`).
- Every feature specification MUST explicitly state the PRD section and version requirements it fulfills.
- Every implementation plan MUST include an explicit Constitution Check gate, with any deviation justified in writing.
- Each completed specification MUST conclude with a brief architectural record documenting key decisions, constraints, and tradeoffs.
- A pilot test with real users MUST be conducted prior to any public release.

### XI. Understood and Explainable Code
Human comprehension is the primary deliverable of this project:
- AI-generated code is welcomed and encouraged, but the author MUST understand and be able to explain every change in detail.
- Code that the author cannot explain MUST be simplified, refactored, or rewritten instead of merged.

## Additional Security & Data Constraints

- **On-Device OCR Execution**: Text extraction from images MUST execute locally on the client device using on-device ML/OCR. Raw image bytes or pixel buffers MUST NEVER be transmitted over the network.
- **Stateless Extraction Pipeline**: The backend processing pipeline acts as an ephemeral processing pipe; shared raw text is processed in memory, converted into structured task JSON, and discarded immediately without persistent logging.
- **Row-Level Security Isolation**: Supabase PostgreSQL tables MUST declare and enforce RLS policies restricting read, update, insert, and delete permissions to authenticated user IDs matching `auth.uid()`.
- **Zero Client Secrets**: No third-party LLM API keys, service role keys, or sensitive backend tokens may be compiled into the Flutter binary or assets.

## Quality Gates & Verification Standards

Before any feature branch or task can be merged into `main`, the following quality gates must pass:
1. **Static Analysis**: `flutter analyze` must report 0 issues.
2. **Architecture Check**: `dart run tool/check_architecture.dart` must pass with 0 rule violations.
3. **Format Check**: `dart format --set-exit-if-changed .` must pass cleanly.
4. **Test Suite**: `flutter test` must pass all tests, including localized date parsing, schema validation, sync conflict resolution, and reminder scheduling.
5. **Constitution & PRD Traceability**: The implementation must be verified against the corresponding specification and PRD requirement.

## Governance

This constitution supersedes all other project documents and development practices, except that the [Gotit Product Requirements Document (PRD)](../../docs/prd.md) defines product scope.
- **Amendments**: Modifying this constitution requires a written rationale, an incremented version number, and corresponding updates to any affected templates, specifications, or tests.
- **Versioning Policy**: The constitution follows Semantic Versioning (`MAJOR.MINOR.PATCH`):
  - **MAJOR**: Incompatible governance changes, principle removals, or significant redefinitions of core principles.
  - **MINOR**: Adding a new principle or section, or materially expanding existing guidance.
  - **PATCH**: Non-semantic clarifications, wording improvements, or typo corrections.
- **Compliance**: All specifications, plans, pull requests, and code reviews MUST explicitly verify compliance with this constitution.

**Version**: 1.0.0 | **Ratified**: 2026-11-03 | **Last Amended**: 2026-11-03
