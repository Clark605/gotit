# Graph Report - gotit  (2026-11-03)

## Corpus Check
- 255 files · ~129,178 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 54 file(s) not represented in the graph (top: .xml 13, .ttf 8, (none) 7)

## Summary
- 3236 nodes · 4407 edges · 178 communities (157 shown, 21 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS · INFERRED: 16 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `574e8367`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- app_localizations.dart
- app_localizations_ar.dart
- app_localizations_en.dart
- app_settings_state.dart
- app_spacing.dart
- app_colors_extension.dart
- with
- app_radius.dart
- app_colors.dart
- CORE DIRECTIVE: PREMIUM MOBILE APP IMAGE DIRECTION
- dependencies
- Gotit: Product Requirements Document
- failure.dart
- steps
- infinite_scroll_list.dart
- app_config.dart
- common.ps1
- rename.dart
- Design System: Furniture Collections List
- app_text_field.dart
- Tasks: [FEATURE NAME]
- speckit-analyze/SKILL.md
- with
- _
- Flavors & Environment Configuration
- onboarding_screen.dart
- example_cubit.dart
- logging_interceptor.dart
- DESIGN.md
- item_model.dart
- app_logger.dart
- update_required_screen.dart
- route_providers.dart
- example_detail_event.dart
- AppDelegate
- app_button.dart
- connectivity_service.dart
- Feature Specification: Local Foundation & Task Management
- Mode: finalize
- Analysis & Synthesis Instructions
- connectivity_state.dart
- Stitch DESIGN.md Skill
- Architectural Blueprint
- app_exception.dart
- context_filter_bar.dart
- rules
- result.dart
- example_screen.dart
- Execution Steps
- connectivity_cubit.dart
- example_detail_screen.dart
- auth_interceptor.dart
- package:injectable/injectable.dart
- prefs_service.dart
- app_database.g.dart
- StatelessWidget
- Design System: Taste Standard
- commands
- secure_storage_service.dart
- theme_gallery_screen.dart
- bootstrap.dart
- route_names.dart
- package:gotit/core/theme/app_spacing.dart
- check_architecture.dart
- Agent Guidelines & Engineering Standards
- app_avatar.dart
- flutter_launcher_icons
- flutter_launcher_icons
- flutter_launcher_icons
- example_detail_state.dart
- Feature Specification: [FEATURE NAME]
- app_date_field.dart
- Core Principles
- speckit-plan/SKILL.md
- speckit-specify/SKILL.md
- speckit-tasks/SKILL.md
- force_update_gate.dart
- example_state.dart
- storage/app_database.dart
- app_navigator.dart
- today_screen.dart
- Core Principles
- manifest.json
- app_durations.dart
- 22. STYLE VARIATION ENGINE
- task_form_cubit.dart
- api_constants.dart
- 🎯 Gotit
- app.dart
- all_tasks_screen_golden_test.dart
- flutter_native_splash
- Implementation Plan: [FEATURE]
- speckit-checklist/SKILL.md
- TasksCubit
- responsive_layout.dart
- 2. Supported Backend Variants
- 1. Design Tokens Scale
- storage_keys.dart
- package:gotit/features/tasks/data/models/task_model.dart
- app_typography.dart
- validators.dart
- item_remote_data_source.dart
- 33. CATEGORY-SPECIFIC BIAS
- speckit-clarify/SKILL.md
- speckit-implement/SKILL.md
- README.md
- setup_env.dart
- Stitch Design System Documentation Skill
- speckit-constitution/SKILL.md
- speckit-taskstoissues/SKILL.md
- task_form_sheet.dart
- AppLocalizations
- 21. MOBILE ANTI-AI-TELLS RULE
- Backend Variant: Supabase
- Tasks: Local Foundation & Task Management (Phase 1)
- [CHECKLIST TYPE] Checklist: [FEATURE NAME]
- 2. PLATFORM MODE RULE
- 37. EXAMPLE INTERPRETATIONS
- [1.0.0] - 2026-10-21
- is_socket_error.dart
- main.dart
- Local Database (Drift) Optional Module
- Push Notifications Optional Module
- policy
- MainActivity.kt
- example_detail_args.dart
- optional-modules.md
- LaunchImage.imageset/README.md
- is_socket_error_stub.dart
- load_status.dart
- Spec Kit Design-First & Architecture Workflow
- app_snackbar.dart
- dev_dependencies
- task_model.dart
- checklist_item_model.dart
- app_icon_size.dart
- breakpoints.dart
- BuildContext
- context_model.dart
- AppColorsExtension
- tasks_state.dart
- task_card.dart
- task_form_state.dart
- Research: Local Foundation & Task Management (Phase 1)
- tasks_cubit.dart
- task_local_data_source_impl.dart
- Data Model: Local Foundation & Task Management (Phase 1)
- Stitch Prompts: Local Foundation & Task Management (Phase 1)
- task_form_sheet_golden_test.dart
- Contract: UI, Routes & Cubits
- 3. Versioning Step-by-Step Runbook
- today_screen_golden_test.dart
- UI Brief: Local Foundation & Task Management (Phase 1)
- ChecklistItemsTableData
- 3. End-to-End Validation Scenarios
- task_detail_screen_golden_test.dart
- Specification Quality Checklist: Local Foundation & Task Management
- Implementation Plan: Local Foundation & Task Management (Phase 1)
- Contributing to `flutter_starter`
- Colors
- 1. Screen-to-Widget Breakdown
- UI Design
- User Scenarios & Testing *(mandatory)*
- ChecklistItemsTable
- Multi-Flavor Versioning & Branch Promotion Rules
- return
- Design Notes: Local Foundation & Task Management (Phase 1)
- Do's and Don'ts
- package:gotit/core/errors/failure.dart
- task_detail_args.dart
- task-local-data-source-contract.md
- task-repository-contract.md

## God Nodes (most connected - your core abstractions)
1. `_` - 54 edges
2. `CORE DIRECTIVE: PREMIUM MOBILE APP IMAGE DIRECTION` - 39 edges
3. `TasksCubit` - 30 edges
4. `TaskFormCubit` - 26 edges
5. `dependencies` - 20 edges
6. `AppDatabase` - 18 edges
7. `Gotit: Product Requirements Document` - 16 edges
8. `Failure` - 15 edges
9. `TaskLocalDataSourceImpl` - 15 edges
10. `TaskRepositoryImpl` - 15 edges

## Surprising Connections (you probably didn't know these)
- `AppSettingsState` --configures--> `freezed`  [EXTRACTED]
  lib/core/cubit/app_settings_state.dart → pubspec.yaml
- `ConnectivityState` --configures--> `freezed`  [EXTRACTED]
  lib/core/cubit/connectivity_state.dart → pubspec.yaml
- `ExampleDetailBloc` --configures--> `injectable`  [EXTRACTED]
  lib/features/example/bloc/example_detail_bloc.dart → pubspec.yaml
- `ExampleDetailEvent` --configures--> `freezed`  [EXTRACTED]
  lib/features/example/bloc/example_detail_event.dart → pubspec.yaml
- `ExampleDetailState` --configures--> `freezed`  [EXTRACTED]
  lib/features/example/bloc/example_detail_state.dart → pubspec.yaml

## Import Cycles
- None detected.

## Communities (178 total, 21 thin omitted)

### Community 0 - "app_localizations.dart"
Cohesion: 0.01
Nodes (130): about, activeStatus, addChecklistItem, addContext, addTask, allClearSubtitle, allClearTitle, allContexts (+122 more)

### Community 1 - "app_localizations_ar.dart"
Cohesion: 0.02
Nodes (122): about, activeStatus, addChecklistItem, addContext, addTask, allClearSubtitle, allClearTitle, allContexts (+114 more)

### Community 2 - "app_localizations_en.dart"
Cohesion: 0.02
Nodes (122): about, activeStatus, addChecklistItem, addContext, addTask, allClearSubtitle, allClearTitle, allContexts (+114 more)

### Community 3 - "app_settings_state.dart"
Cohesion: 0.20
Nodes (15): _, AppSettingsStatePatterns, class, hashCode, identical, null, operator, orElse (+7 more)

### Community 4 - "app_spacing.dart"
Cohesion: 0.04
Nodes (53): AppSpacing, bottomNavHeight, buttonHeight, checkboxSize, chipHeight, edgeInsetsAllLg, edgeInsetsAllMd, edgeInsetsAllSm (+45 more)

### Community 5 - "app_colors_extension.dart"
Cohesion: 0.05
Nodes (37): accent, accentPressed, accentSoft, appColors, border, canvas, charcoal, copyWith (+29 more)

### Community 6 - "with"
Cohesion: 0.05
Nodes (43): name, needs, runs-on, steps, timeout-minutes, name, needs, runs-on (+35 more)

### Community 7 - "app_radius.dart"
Cohesion: 0.07
Nodes (25): AppRadius, bottomLg, bottomMd, full, fullRadius, fullValue, lg, lgRadius (+17 more)

### Community 8 - "app_colors.dart"
Cohesion: 0.02
Nodes (79): accent, accentPressed, accentSoft, AppColors, avatarPalette, black, canvas, charcoal (+71 more)

### Community 9 - "CORE DIRECTIVE: PREMIUM MOBILE APP IMAGE DIRECTION"
Cohesion: 0.06
Nodes (34): 10. DEVICE MOCKUP FRAME RULE, 11. ONBOARDING FLOW RULE, 12. FIRST SCREEN CLEANLINESS RULE, 13. SAFE AREA AND SYSTEM REGION RULE, 14. NAVIGATION RULE, 15. CLEAN LAYOUT RULE, 16. CREATIVE IMAGE DIRECTION RULE, 17. BACKGROUND TEXTURE AND SURFACE RULE (+26 more)

### Community 10 - "dependencies"
Cohesion: 0.05
Nodes (36): dependencies, connectivity_plus, dio, drift, drift_flutter, flutter, flutter_bloc, flutter_localizations (+28 more)

### Community 11 - "Gotit: Product Requirements Document"
Cohesion: 0.06
Nodes (32): 10. Success Metrics, 11. Privacy and Security, 12. Non-Functional Requirements, 13. Risks and Mitigations, 14. Milestones (Rough), 15. Open Questions, 1. Overview, 2. Goals and Non-Goals (+24 more)

### Community 12 - "failure.dart"
Cohesion: 0.05
Nodes (44): cancelled, CancelledFailure, code, conflict, ConflictFailure, Failure, fieldErrors, forbidden (+36 more)

### Community 13 - "steps"
Cohesion: 0.06
Nodes (30): args, inputs, integration, spec, default, prompt, type, any (+22 more)

### Community 14 - "infinite_scroll_list.dart"
Cohesion: 0.08
Nodes (23): GotitApp, _GotitAppState, build, controller, _createdController, createState, dispose, emptyWidget (+15 more)

### Community 15 - "app_config.dart"
Cohesion: 0.07
Nodes (24): AppConfig, AppFlavor, applicationId, appName, baseUrl, connectTimeout, connectTimeoutSeconds, enableLogging (+16 more)

### Community 16 - "common.ps1"
Cohesion: 0.16
Nodes (19): Find-SpecifyRoot(), Format-SpecKitCommand(), Get-CurrentBranch(), Get-FeaturePathsEnv(), Get-InvokeSeparator(), Get-NormalizedPriority(), Get-Python3Command(), Get-RepoRoot() (+11 more)

### Community 17 - "rename.dart"
Cohesion: 0.07
Nodes (27): content, currentNameMatch, dartDirs, display, enArb, envDir, first, gradleFile (+19 more)

### Community 18 - "Design System: Furniture Collections List"
Cohesion: 0.07
Nodes (26): 1. Visual Theme & Atmosphere, 2. Color Palette & Roles, 3. Typography Rules, 4. Component Stylings, 5. Layout Principles, 6. Design System Notes for Stitch Generation, Accent & Interactive, Alignment & Visual Balance (+18 more)

### Community 19 - "app_text_field.dart"
Cohesion: 0.07
Nodes (22): AppTextField, _AppTextFieldState, autofocus, autovalidateMode, build, controller, createState, enabled (+14 more)

### Community 20 - "Tasks: [FEATURE NAME]"
Cohesion: 0.07
Nodes (26): Dependencies & Execution Order, Format: `[ID] [P?] [Story] Description`, Implementation for User Story 1, Implementation for User Story 2, Implementation for User Story 3, Implementation Strategy, Incremental Delivery, MVP First (User Story 1 Only) (+18 more)

### Community 21 - "speckit-analyze/SKILL.md"
Cohesion: 0.08
Nodes (25): 1. Initialize Analysis Context, 2. Load Artifacts (Progressive Disclosure), 3. Build Semantic Models, 4. Detection Passes (Token-Efficient Analysis), 5. Severity Assignment, 6. Produce Compact Analysis Report, 7. Provide Next Actions, 8. Offer Remediation (+17 more)

### Community 22 - "with"
Cohesion: 0.08
Nodes (25): concurrency, cancel-in-progress, group, jobs, validate, name, on, pull_request (+17 more)

### Community 23 - "_"
Cohesion: 0.06
Nodes (7): _, GetItInjectableX, init, dio, ForceUpdateGate, PrefsService, SecureStorageService

### Community 24 - "Flavors & Environment Configuration"
Cohesion: 0.08
Nodes (23): 1. Environment Files, 2. Running & Building per Flavor, 3. Native Setup, 4. Flavor-Specific App Icons, 5. Release Signing, Android (`android/app/build.gradle.kts`), CI/CD Secret Injection, Development (+15 more)

### Community 25 - "onboarding_screen.dart"
Cohesion: 0.12
Nodes (12): AppRouter, AuthRedirect, _fadeRoute, onGenerateRoute, build, _completeOnboarding, createState, _currentPage (+4 more)

### Community 26 - "example_cubit.dart"
Cohesion: 0.09
Nodes (15): createItem, loadItems, loadMore, _pageSize, refresh, _repository, createItem, getItem (+7 more)

### Community 27 - "logging_interceptor.dart"
Cohesion: 0.09
Nodes (15): AuthInterceptor, onError, onRequest, onResponse, SafeLoggingInterceptor, _sanitizeData, _sanitizeHeaders, _sensitiveBodyKeys (+7 more)

### Community 28 - "DESIGN.md"
Cohesion: 0.15
Nodes (12): Accessibility, Components, Elevation and Depth, Iteration Guide, Known Gaps, Layout, Mobile Behavior, Motion (+4 more)

### Community 29 - "item_model.dart"
Cohesion: 0.17
Nodes (18): _, class, hashCode, id, identical, ItemModelPatterns, null, operator (+10 more)

### Community 30 - "app_logger.dart"
Cohesion: 0.09
Nodes (19): AppLogger, _cyan, debug, error, ExecutionTimer, _gray, info, _log (+11 more)

### Community 31 - "update_required_screen.dart"
Cohesion: 0.08
Nodes (16): AppSettingsCubit, ConnectivityCubit, build, child, OfflineBanner, build, NoInternetScreen, onRetry (+8 more)

### Community 32 - "route_providers.dart"
Cohesion: 0.07
Nodes (16): buildAllTasksRoute, buildErrorRoute, buildExampleDetailRoute, buildExampleRoute, buildMaintenanceRoute, buildNoInternetRoute, buildNotFoundRoute, buildOnboardingRoute (+8 more)

### Community 33 - "example_detail_event.dart"
Cohesion: 0.19
Nodes (17): _, class, ExampleDetailEventPatterns, hashCode, id, identical, null, operator (+9 more)

### Community 34 - "AppDelegate"
Cohesion: 0.11
Nodes (6): Flutter, AppDelegate, SceneDelegate, RunnerTests, UIKit, XCTest

### Community 35 - "app_button.dart"
Cohesion: 0.08
Nodes (19): AppButtonVariant, borderRadius, build, height, icon, isExpanded, isLoading, label (+11 more)

### Community 36 - "connectivity_service.dart"
Cohesion: 0.11
Nodes (11): close, _connectivityService, _init, refresh, _subscription, _connectivity, ConnectivityService, _hasConnection (+3 more)

### Community 37 - "Feature Specification: Local Foundation & Task Management"
Cohesion: 0.20
Nodes (10): Assumptions, Clarifications, Design References, Feature Specification: Local Foundation & Task Management, Functional Requirements, Key Entities *(include if feature involves data)*, Measurable Outcomes, Requirements *(mandatory)* (+2 more)

### Community 38 - "Mode: finalize"
Cohesion: 0.11
Nodes (18): 1. Create the folder, 1. Verify assets, 2. Reconcile, 2. Write `ui-brief.md`, 3. Update `spec.md` (append only), 3. Write `stitch-prompts.md`, 4. Stitch MCP (only if connected), 4. Update `plan.md` (+10 more)

### Community 39 - "Analysis & Synthesis Instructions"
Cohesion: 0.11
Nodes (18): 1. Define the Atmosphere, 2. Map the Color Palette, 3. Establish Typography Rules, 4. Define the Hero Section, 5. Describe Component Stylings, 6. Define Layout Principles, 7. Define Responsive Rules, 8. Encode Motion Philosophy (+10 more)

### Community 40 - "connectivity_state.dart"
Cohesion: 0.20
Nodes (16): _, class, ConnectivityStatePatterns, hasCheckedInitial, hashCode, identical, isOnline, null (+8 more)

### Community 41 - "Stitch DESIGN.md Skill"
Cohesion: 0.11
Nodes (17): 1. Extract Project Identity (JSON), 2. Define the Atmosphere (Image/HTML), 3. Map the Color Palette (Tailwind Config/JSON), 4. Translate Geometry & Shape (CSS/Tailwind), 5. Describe Depth & Elevation, Analysis & Synthesis Instructions, Best Practices, Common Pitfalls to Avoid (+9 more)

### Community 42 - "Architectural Blueprint"
Cohesion: 0.11
Nodes (18): 1. The Seam: Why There Is No Domain Layer, 2. Guarded Actions (`ActionGuard`), 3. Pluggable Error Mapping & Failures, 4. Central Routing & Navigation Guarding, 5. Startup Bootstrap Sequence, 6. Architecture Linter (`tool/check_architecture.dart`), 7. Web Support, Architectural Blueprint (+10 more)

### Community 43 - "app_exception.dart"
Cohesion: 0.09
Nodes (25): AppException, CancelledException, code, fieldErrors, ForbiddenException, message, NetworkException, NotFoundException (+17 more)

### Community 44 - "context_filter_bar.dart"
Cohesion: 0.12
Nodes (13): BottomNavBar, BottomNavTab, build, _buildNavItem, currentTab, onTabSelected, build, _buildChip (+5 more)

### Community 45 - "rules"
Cohesion: 0.12
Nodes (16): analyzer, exclude, include, linter, rules, always_use_package_imports, avoid_catches_without_on_clauses, avoid_print (+8 more)

### Community 46 - "result.dart"
Cohesion: 0.15
Nodes (13): data, Error, failure, failureOrNull, getOrElse, getOrNull, hashCode, isFailure (+5 more)

### Community 47 - "example_screen.dart"
Cohesion: 0.15
Nodes (7): ExampleCubit, build, _buildList, _buildSkeleton, ExampleScreen, _showCreateBottomSheet, injectable

### Community 48 - "Execution Steps"
Cohesion: 0.12
Nodes (15): 1. Initialize Convergence Context, 2. Load Artifacts (Progressive Disclosure), 3. Build the Intent Inventory, 4. Assess the Codebase and Classify Findings, 5. Assign Severity, 6. Present the In-Session Findings Summary, 7. Append Convergence Tasks (or report converged), 8. Provide Next Actions (Handoff) (+7 more)

### Community 49 - "connectivity_cubit.dart"
Cohesion: 0.12
Nodes (12): clearMappers, CustomErrorMapper, _customMappers, ErrorMapper, map, register, getToken, init (+4 more)

### Community 50 - "example_detail_screen.dart"
Cohesion: 0.10
Nodes (14): ExampleDetailBloc, _onLoad, _onRefresh, _repository, ExampleDetailEvent, build, _buildContent, _buildSkeleton (+6 more)

### Community 51 - "auth_interceptor.dart"
Cohesion: 0.13
Nodes (11): notifySessionExpired, onError, onRequest, onSessionExpired, _sessionExpiredController, _tokenProvider, getAccessToken, getRefreshToken (+3 more)

### Community 52 - "package:injectable/injectable.dart"
Cohesion: 0.15
Nodes (8): configureDependencies, getIt, IAnalyticsService, logEvent, NoOpAnalyticsService, setCurrentScreen, setUserId, setUserProperty

### Community 53 - "prefs_service.dart"
Cohesion: 0.11
Nodes (15): DioModule, clearAll, getBool, getLocaleCode, getString, getThemeMode, hasSeenOnboarding, _prefs (+7 more)

### Community 54 - "app_database.g.dart"
Cohesion: 0.04
Nodes (54): _, actualTableName, _alias, aliasedName, allSchemaEntities, allTables, _checklistItemsTableRefsTable, _colorValueMeta (+46 more)

### Community 55 - "StatelessWidget"
Cohesion: 0.06
Nodes (33): AppButton, AppEmptyState, build, ctaText, description, icon, onCtaPressed, title (+25 more)

### Community 56 - "Design System: Taste Standard"
Cohesion: 0.13
Nodes (14): 1. Visual Theme & Atmosphere, 2. Color Palette & Roles, 3. Typography Rules, 4. Component Stylings, 5. Hero Section, 6. Layout Principles, 7. Responsive Rules, 8. Motion & Interaction (Code-Phase Intent) (+6 more)

### Community 57 - "commands"
Cohesion: 0.13
Nodes (14): run, run, analyze, architecture-check, conventional-commit, format, commit-msg, commands (+6 more)

### Community 58 - "secure_storage_service.dart"
Cohesion: 0.14
Nodes (10): clearTokens, delete, deleteAll, getAccessToken, getRefreshToken, hasTokens, read, saveTokens (+2 more)

### Community 59 - "theme_gallery_screen.dart"
Cohesion: 0.07
Nodes (24): AppTheme, dark, light, build, _buildBottomNavPreview, _buildButtonsSection, _buildColorGrid, _buildContextTagsSection (+16 more)

### Community 60 - "bootstrap.dart"
Cohesion: 0.07
Nodes (19): bootstrap, initialRoute, initialRouteArgs, isCrashReporterReady, preInitErrors, startupTimer, widgetsBinding, ActionGuardConfig (+11 more)

### Community 61 - "route_names.dart"
Cohesion: 0.11
Nodes (17): allTasks, error, example, exampleDetail, home, initial, maintenance, noInternet (+9 more)

### Community 62 - "package:gotit/core/theme/app_spacing.dart"
Cohesion: 0.07
Nodes (27): buildDarkTheme, colorScheme, textTheme, buildLightTheme, colorScheme, textTheme, build, TaskStatus (+19 more)

### Community 63 - "check_architecture.dart"
Cohesion: 0.14
Nodes (13): allowedCoreFeatureImporters, current, dartFiles, false, importRegex, importUri, _isIgnored, libDir (+5 more)

### Community 64 - "Agent Guidelines & Engineering Standards"
Cohesion: 0.15
Nodes (13): 10. Git Workflow, 11. Definition of Done, 1. Project Overview, 2. Architecture & The 8 Golden Rules, 3. Directory Map (`lib/core/`), 4. Mandatory New-Feature Checklist (Spec-Driven & Design-First), 5. Reference Implementation, 6. Naming Conventions (+5 more)

### Community 65 - "app_avatar.dart"
Cohesion: 0.14
Nodes (11): AppAvatar, backgroundColor, border, build, imageUrl, _isUnassigned, name, size (+3 more)

### Community 66 - "flutter_launcher_icons"
Cohesion: 0.15
Nodes (12): flutter_launcher_icons, adaptive_icon_background, adaptive_icon_foreground, android, image_path, ios, min_sdk_android, web (+4 more)

### Community 67 - "flutter_launcher_icons"
Cohesion: 0.15
Nodes (12): flutter_launcher_icons, adaptive_icon_background, adaptive_icon_foreground, android, image_path, ios, min_sdk_android, web (+4 more)

### Community 68 - "flutter_launcher_icons"
Cohesion: 0.15
Nodes (12): flutter_launcher_icons, adaptive_icon_background, adaptive_icon_foreground, android, image_path, ios, min_sdk_android, web (+4 more)

### Community 69 - "example_detail_state.dart"
Cohesion: 0.22
Nodes (15): _, class, ExampleDetailStatePatterns, hashCode, identical, null, operator, orElse (+7 more)

### Community 70 - "Feature Specification: [FEATURE NAME]"
Cohesion: 0.15
Nodes (12): Assumptions, Edge Cases, Feature Specification: [FEATURE NAME], Functional Requirements, Key Entities *(include if feature involves data)*, Measurable Outcomes, Requirements *(mandatory)*, Success Criteria *(mandatory)* (+4 more)

### Community 71 - "app_date_field.dart"
Cohesion: 0.17
Nodes (9): AppDateField, build, firstDate, label, lastDate, onDateSelected, placeholder, _selectDate (+1 more)

### Community 72 - "Core Principles"
Cohesion: 0.17
Nodes (12): Core Principles, I. Purpose and Scope, II. Absolute Privacy (Non-Negotiable), III. Local-First Data and Offline Resilience, IV. Reliable AI Extraction and Evaluation, IX. Branching and Git Workflow, V. Resilient Reminders and Permissions, VI. Template-Driven Architecture and Layer Boundaries (+4 more)

### Community 73 - "speckit-plan/SKILL.md"
Cohesion: 0.18
Nodes (10): Completion Report, Done When, Key rules, Mandatory Post-Execution Hooks, Outline, Phase 0: Outline & Research, Phase 1: Design & Contracts, Phases (+2 more)

### Community 74 - "speckit-specify/SKILL.md"
Cohesion: 0.18
Nodes (10): Completion Report, Done When, For AI Generation, Mandatory Post-Execution Hooks, Outline, Pre-Execution Checks, Quick Guidelines, Section Requirements (+2 more)

### Community 75 - "speckit-tasks/SKILL.md"
Cohesion: 0.18
Nodes (10): Checklist Format (REQUIRED), Completion Report, Done When, Mandatory Post-Execution Hooks, Outline, Phase Structure, Pre-Execution Checks, Task Generation Rules (+2 more)

### Community 76 - "force_update_gate.dart"
Cohesion: 0.10
Nodes (13): _loadPackageInfo, _prefs, setLocale, setThemeMode, toggleThemeMode, check, GateCheckResult, GateStatus (+5 more)

### Community 77 - "example_state.dart"
Cohesion: 0.22
Nodes (16): _, class, ExampleStatePatterns, hashCode, identical, _items, null, operator (+8 more)

### Community 78 - "storage/app_database.dart"
Cohesion: 0.04
Nodes (36): attachedDatabase, checklistItemsTableRefs, _contextIdMeta, fromJson, _iconMeta, map, colorValue, content (+28 more)

### Community 79 - "app_navigator.dart"
Cohesion: 0.18
Nodes (6): AppNavigator, canPop, currentContext, currentState, navigatorKey, resetKeyForTesting

### Community 80 - "today_screen.dart"
Cohesion: 0.07
Nodes (17): l10n, build, _openTaskForm, build, _buildTaskRow, createState, _currentDay, dispose (+9 more)

### Community 81 - "Core Principles"
Cohesion: 0.18
Nodes (10): Core Principles, Governance, [PRINCIPLE_1_NAME], [PRINCIPLE_2_NAME], [PRINCIPLE_3_NAME], [PRINCIPLE_4_NAME], [PRINCIPLE_5_NAME], [PROJECT_NAME] Constitution (+2 more)

### Community 82 - "manifest.json"
Cohesion: 0.18
Nodes (10): background_color, description, display, icons, name, orientation, prefer_related_applications, short_name (+2 more)

### Community 83 - "app_durations.dart"
Cohesion: 0.15
Nodes (10): AppDurations, checkDraw, defaultCurve, enterCurve, exitCurve, fast, medium, normal (+2 more)

### Community 84 - "22. STYLE VARIATION ENGINE"
Cohesion: 0.20
Nodes (10): 22. STYLE VARIATION ENGINE, Decorative Asset Set, Image Art Direction Bias, Motion-Implied Language, Palette Logic, Signature Component Set, Structure Bias, Texture / Surface Treatment (+2 more)

### Community 85 - "task_form_cubit.dart"
Cohesion: 0.06
Nodes (27): addChecklistItem, _existingChecklist, initializeForEdit, removeChecklistItem, _repository, reset, save, updateChecklistItem (+19 more)

### Community 86 - "api_constants.dart"
Cohesion: 0.20
Nodes (8): ApiConstants, baseUrl, itemDetail, items, login, logout, refresh, register

### Community 87 - "🎯 Gotit"
Cohesion: 0.13
Nodes (15): 1. Prerequisites, 2. Set Up Environment, 3. Dependencies & Code Generation, 4. Run the Dev Flavor, 📊 AI Prompt & Extraction Evaluation, 🔮 Future Roadmap, ⚡ Getting Started, 🎯 Gotit (+7 more)

### Community 88 - "app.dart"
Cohesion: 0.12
Nodes (7): build, createState, dispose, initialRoute, initialRouteArgs, initState, _sessionExpiredSubscription

### Community 89 - "all_tasks_screen_golden_test.dart"
Cohesion: 0.05
Nodes (52): AppDatabase, TaskLocalDataSourceImpl, TaskLocalDataSource, TaskRepositoryImpl, TaskRepository, main, cubit, database (+44 more)

### Community 90 - "flutter_native_splash"
Cohesion: 0.22
Nodes (8): color, image, flutter_native_splash, android, android_12, color, image, ios

### Community 91 - "Implementation Plan: [FEATURE]"
Cohesion: 0.22
Nodes (8): Complexity Tracking, Constitution Check, Documentation (this feature), Implementation Plan: [FEATURE], Project Structure, Source Code (repository root), Summary, Technical Context

### Community 92 - "speckit-checklist/SKILL.md"
Cohesion: 0.25
Nodes (7): Anti-Examples: What NOT To Do, Checklist Purpose: "Unit Tests for English", Example Checklist Types & Sample Items, Execution Steps, Post-Execution Checks, Pre-Execution Checks, User Input

### Community 93 - "TasksCubit"
Cohesion: 0.08
Nodes (28): ActionGuard, BaseCubit, emit, TaskFormCubit, TasksCubit, AllTasksScreen, build, _buildChecklistSection (+20 more)

### Community 94 - "responsive_layout.dart"
Cohesion: 0.15
Nodes (10): build, desktop, isDesktop, isMobile, isTablet, mobile, ResponsiveLayout, screenHeight (+2 more)

### Community 95 - "2. Supported Backend Variants"
Cohesion: 0.25
Nodes (7): 1. The Seam: `I<Feature>Repository`, 2. Supported Backend Variants, A. REST via Dio (Default), B. Cloud Firestore (Firebase), Backend-Agnostic Architecture & Swap Points, C. Supabase, D. GraphQL

### Community 96 - "1. Design Tokens Scale"
Cohesion: 0.25
Nodes (7): 1. Design Tokens Scale, 2. Locale-Aware Typography, 3. Semantic Theme Extensions (`AppColorsExtension`), Animation Durations & Curves (`AppDurations`), Design Tokens & Theming System, Radii (`AppRadius`), Spacing (`AppSpacing`)

### Community 97 - "storage_keys.dart"
Cohesion: 0.22
Nodes (7): accessToken, hasSeenOnboarding, locale, refreshToken, StorageKeys, themeMode, userId

### Community 98 - "package:gotit/features/tasks/data/models/task_model.dart"
Cohesion: 0.08
Nodes (22): deleteContext, getTaskById, insertContext, insertTask, softDeleteTask, toggleChecklistItem, toggleTaskStatus, updateTask (+14 more)

### Community 99 - "app_typography.dart"
Cohesion: 0.10
Nodes (17): AppTypography, arabicFontFamily, body, bodyMedium, bodySm, button, caption, captionBold (+9 more)

### Community 100 - "validators.dart"
Cohesion: 0.25
Nodes (6): email, _emailRegex, FormValidators, matches, minLength, requiredField

### Community 101 - "item_remote_data_source.dart"
Cohesion: 0.29
Nodes (6): createItem, _dio, getItem, getItems, ItemRemoteDataSource, ItemRemoteDataSourceImpl

### Community 102 - "33. CATEGORY-SPECIFIC BIAS"
Cohesion: 0.29
Nodes (7): 33. CATEGORY-SPECIFIC BIAS, Commerce, Fintech, Health / Fitness, Productivity, Social, Wellness / Lifestyle

### Community 103 - "speckit-clarify/SKILL.md"
Cohesion: 0.29
Nodes (6): Completion Report, Done When, Mandatory Post-Execution Hooks, Outline, Pre-Execution Checks, User Input

### Community 104 - "speckit-implement/SKILL.md"
Cohesion: 0.29
Nodes (6): Completion Report, Done When, Mandatory Post-Execution Hooks, Outline, Pre-Execution Checks, User Input

### Community 105 - "README.md"
Cohesion: 0.20
Nodes (4): Additional Security & Data Constraints, Gotit Constitution, Governance, Quality Gates & Verification Standards

### Community 106 - "setup_env.dart"
Cohesion: 0.25
Nodes (5): createdCount, envDir, exampleFiles, force, main

### Community 107 - "Stitch Design System Documentation Skill"
Cohesion: 0.33
Nodes (5): Example Prompt, How it Works, Install, Skill Structure, Stitch Design System Documentation Skill

### Community 108 - "speckit-constitution/SKILL.md"
Cohesion: 0.33
Nodes (5): Outline, Post-Execution Checks, Pre-Execution Checks, Scope Guard, User Input

### Community 109 - "speckit-taskstoissues/SKILL.md"
Cohesion: 0.33
Nodes (5): Deprecation Notice, Outline, Post-Execution Checks, Pre-Execution Checks, User Input

### Community 110 - "task_form_sheet.dart"
Cohesion: 0.08
Nodes (20): build, _buildChecklistSection, _buildContextChips, _buildDateTimeRow, _buildEffortChips, _checklistController, contexts, createState (+12 more)

### Community 111 - "AppLocalizations"
Cohesion: 0.33
Nodes (5): AppLocalizations, _AppLocalizationsDelegate, AppLocalizationsAr, AppLocalizationsEn, of

### Community 112 - "21. MOBILE ANTI-AI-TELLS RULE"
Cohesion: 0.40
Nodes (5): 21. MOBILE ANTI-AI-TELLS RULE, Copy AI tells, Layout AI tells, UI clutter tells, Visual AI tells

### Community 113 - "Backend Variant: Supabase"
Cohesion: 0.40
Nodes (4): 1. Dependencies to Add to `pubspec.yaml`, 2. Initialization & Error Mapping, 3. Architecture Swap Point, Backend Variant: Supabase

### Community 114 - "Tasks: Local Foundation & Task Management (Phase 1)"
Cohesion: 0.08
Nodes (23): Dependencies & Execution Order, Format: `- [ ] [TaskID] [P?] [Story?] Description with file path`, Implementation for User Story 1, Implementation for User Story 2, Implementation for User Story 3, Implementation for User Story 4, Implementation Strategy, Incremental Delivery (Phases 4, 5, 6, & 7) (+15 more)

### Community 115 - "[CHECKLIST TYPE] Checklist: [FEATURE NAME]"
Cohesion: 0.40
Nodes (4): [Category 1], [Category 2], [CHECKLIST TYPE] Checklist: [FEATURE NAME], Notes

### Community 116 - "2. PLATFORM MODE RULE"
Cohesion: 0.50
Nodes (4): 2. PLATFORM MODE RULE, Android-native premium, Cross-platform premium neutral, iOS-native premium

### Community 117 - "37. EXAMPLE INTERPRETATIONS"
Cohesion: 0.50
Nodes (4): 37. EXAMPLE INTERPRETATIONS, Example 1, Example 2, Example 3

### Community 118 - "[1.0.0] - 2026-10-21"
Cohesion: 0.50
Nodes (3): [1.0.0] - 2026-10-21, Added, Changelog

### Community 121 - "Local Database (Drift) Optional Module"
Cohesion: 0.50
Nodes (3): 1. Dependencies to Add to `pubspec.yaml`, 2. Architecture & Cache-First Pattern, Local Database (Drift) Optional Module

### Community 122 - "Push Notifications Optional Module"
Cohesion: 0.50
Nodes (3): 1. Dependencies to Add to `pubspec.yaml`, 2. Wiring Steps, Push Notifications Optional Module

### Community 136 - "Spec Kit Design-First & Architecture Workflow"
Cohesion: 0.22
Nodes (8): 1. Specification (`/speckit-specify`), 2. Clarification (`/speckit-clarify`), 3. Architecture & Planning with Graphify (`/speckit-plan`), 4. UI Design Stage (`speckit-ui brief`), 5. UI Finalization & Plan Synchronization (`speckit-ui finalize`), 6. Task Generation (`/speckit-tasks`), 7. Implementation & Graphify Update (`/speckit-implement`), Spec Kit Design-First & Architecture Workflow

### Community 137 - "app_snackbar.dart"
Cohesion: 0.22
Nodes (8): showAppErrorSnackBar, showAppInfoSnackBar, showAppSnackBar, showAppSuccessSnackBar, showErrorSnackBar, showInfoSnackBar, showSnackBar, showSuccessSnackBar

### Community 138 - "dev_dependencies"
Cohesion: 0.20
Nodes (10): dev_dependencies, build_runner, drift_dev, flutter_launcher_icons, flutter_lints, flutter_test, freezed, injectable_generator (+2 more)

### Community 139 - "task_model.dart"
Cohesion: 0.17
Nodes (19): _, _checklist, class, hashCode, id, identical, null, operator (+11 more)

### Community 140 - "checklist_item_model.dart"
Cohesion: 0.18
Nodes (18): _, ChecklistItemModelPatterns, class, hashCode, id, identical, null, operator (+10 more)

### Community 141 - "app_icon_size.dart"
Cohesion: 0.25
Nodes (7): AppIconSize, lg, md, sm, xl, xs, xxl

### Community 142 - "breakpoints.dart"
Cohesion: 0.29
Nodes (5): Breakpoints, desktop, largeDesktop, mobile, tablet

### Community 143 - "BuildContext"
Cohesion: 0.40
Nodes (4): LocalizationContextExtension, AppColorsExtensionContext, ResponsiveContextExtension, AppSnackBarExtension

### Community 144 - "context_model.dart"
Cohesion: 0.18
Nodes (18): _, class, ContextModelPatterns, hashCode, id, identical, null, operator (+10 more)

### Community 146 - "tasks_state.dart"
Cohesion: 0.20
Nodes (18): _, _allTasks, class, _contexts, hashCode, identical, null, operator (+10 more)

### Community 147 - "task_card.dart"
Cohesion: 0.10
Nodes (16): build, colorValue, ContextTag, fromModel, name, onTap, _resolveColors, build (+8 more)

### Community 148 - "task_form_state.dart"
Cohesion: 0.22
Nodes (16): _, _checklistDrafts, class, hashCode, identical, null, operator, orElse (+8 more)

### Community 149 - "Research: Local Foundation & Task Management (Phase 1)"
Cohesion: 0.11
Nodes (17): 1. Local Database & ORM Selection: Drift vs SQLite vs Isar vs Hive, 2. Dynamic Start Date Derivation vs Explicit Start Time, 3. Today View Grouping & Sorting Strategy, 4. State Management & Layer Boundaries (8 Golden Rules), 5. Dependency Additions Justification, Alternatives Considered, Alternatives Considered, Alternatives Considered (+9 more)

### Community 150 - "tasks_cubit.dart"
Cohesion: 0.12
Nodes (15): addCustomContext, _allTasksSub, close, _contextsSub, deleteCustomContext, deleteTask, initSubscriptions, _repository (+7 more)

### Community 151 - "task_local_data_source_impl.dart"
Cohesion: 0.12
Nodes (14): _db, deleteContext, getTaskById, insertContext, insertTask, _mapTaskDataToModel, softDeleteTask, _todaySectionOrder (+6 more)

### Community 152 - "Data Model: Local Foundation & Task Management (Phase 1)"
Cohesion: 0.13
Nodes (14): 1. Domain Entities & Drift Tables, 2.1 `ContextsTable`, 2.2 `TasksTable`, 2.3 `ChecklistItemsTable`, 2. Table Definitions (Drift Schema), 3. Seed Data (Default Contexts), 4.1 `TaskModel` (`task_model.dart`), 4.2 `ChecklistItemModel` (`checklist_item_model.dart`) (+6 more)

### Community 153 - "Stitch Prompts: Local Foundation & Task Management (Phase 1)"
Cohesion: 0.14
Nodes (13): Prompt:, Prompt:, Prompt:, Prompt:, Prompt:, Screen 1: Today Screen (`TodayScreen`), Screen 2: All Tasks Screen (`AllTasksScreen`), Screen 3: Task Detail Screen (`TaskDetailScreen`) (+5 more)

### Community 154 - "task_form_sheet_golden_test.dart"
Cohesion: 0.18
Nodes (8): _buildFormTestApp, contexts, cubit, database, dataSource, locale, main, repository

### Community 155 - "Contract: UI, Routes & Cubits"
Cohesion: 0.18
Nodes (10): 1. Routes & Navigation Arguments, 2.1 `TasksCubit` (`lib/features/tasks/cubit/tasks_cubit.dart`), 2.2 `TaskFormCubit` (`lib/features/tasks/cubit/task_form_cubit.dart`), 2. Cubits & States, 3. UI Screens & Modals, Contract: UI, Routes & Cubits, Navigation Arguments (`lib/features/tasks/ui/task_detail_args.dart`), Route Names (`lib/core/routes/route_names.dart`) (+2 more)

### Community 156 - "3. Versioning Step-by-Step Runbook"
Cohesion: 0.20
Nodes (9): 1. Version Format in Flutter, 2. Branch to Flavor & Version Mapping, 3. Versioning Step-by-Step Runbook, 4. Phase Roadmap Target Versions, A. When working on a Feature Branch (`feat/<name>`):, B. When Merging into `dev`:, C. When Promoting to `staging`:, D. When Releasing to `main` (Production): (+1 more)

### Community 157 - "today_screen_golden_test.dart"
Cohesion: 0.20
Nodes (8): _buildTodayTestApp, database, dataSource, formCubit, locale, main, repository, tasksCubit

### Community 158 - "UI Brief: Local Foundation & Task Management (Phase 1)"
Cohesion: 0.20
Nodes (9): Open Questions, Screen 1: Today Screen (`TodayScreen`), Screen 2: All Tasks Screen (`AllTasksScreen`), Screen 3: Task Detail Screen (`TaskDetailScreen`), Screen 4: Task Form Sheet (`TaskFormSheet`), Screen 5: Context Management Sheet (`ContextManagementSheet`), Screen Inventory, Shared Components (+1 more)

### Community 159 - "ChecklistItemsTableData"
Cohesion: 0.33
Nodes (7): ChecklistItemsTableCompanion, ChecklistItemsTableData, ContextsTableCompanion, ContextsTableData, DataClass, TasksTableCompanion, TasksTableData

### Community 160 - "3. End-to-End Validation Scenarios"
Cohesion: 0.22
Nodes (9): 1. Prerequisites & Setup, 2. Automated Test Execution, 3. End-to-End Validation Scenarios, Quickstart & Validation Guide: Local Foundation & Task Management, Scenario 1: Offline Task Creation & Persistence (FR-001, FR-002, SC-001), Scenario 2: Today View Grouping & Sorting (FR-003, SC-002), Scenario 3: Task Status Toggle & All Tasks Filtering (FR-004, SC-004), Scenario 4: Context Lifecycle & Safe Unassign (FR-008) (+1 more)

### Community 161 - "task_detail_screen_golden_test.dart"
Cohesion: 0.22
Nodes (8): _buildDetailScreenApp, database, dataSource, formCubit, locale, main, repository, tasksCubit

### Community 162 - "Specification Quality Checklist: Local Foundation & Task Management"
Cohesion: 0.25
Nodes (5): Content Quality, Feature Readiness, Notes, Requirement Completeness, Specification Quality Checklist: Local Foundation & Task Management

### Community 163 - "Implementation Plan: Local Foundation & Task Management (Phase 1)"
Cohesion: 0.25
Nodes (8): Complexity Tracking, Constitution Check, Documentation (`specs/001-local-tasks/`), Implementation Plan: Local Foundation & Task Management (Phase 1), Project Structure, Source Code (`lib/`), Summary, Technical Context

### Community 164 - "Contributing to `flutter_starter`"
Cohesion: 0.29
Nodes (7): 1. Branch Naming Conventions, 2. Commit Message Guidelines (Conventional Commits), 3. Architecture Rules & The 8 Golden Rules, 4. Mandatory Verification Pipeline, Contributing to `flutter_starter`, Examples:, Types:

### Community 165 - "Colors"
Cohesion: 0.29
Nodes (7): Accent, Colors, Context tints, Dark theme (values to verify with a contrast check), Semantic, Surfaces and lines, Text

### Community 166 - "1. Screen-to-Widget Breakdown"
Cohesion: 0.33
Nodes (6): 1. Screen-to-Widget Breakdown, A. Today Screen (`TodayScreen`), B. All Tasks Screen (`AllTasksScreen`), C. Task Detail Screen (`TaskDetailScreen`), D. Task Form Sheet (`TaskFormSheet`), E. Context Management Sheet (`ContextManagementSheet`)

### Community 167 - "UI Design"
Cohesion: 0.33
Nodes (6): 2. Shared Widgets Inventory, 3. Theme & Token Enforcement, 4. Test Plan (Golden & Widget Tests), 5. Design Deviations & Enhancements, 6. Constitution Check (UI Gate), UI Design

### Community 168 - "User Scenarios & Testing *(mandatory)*"
Cohesion: 0.33
Nodes (6): Edge Cases, User Scenarios & Testing *(mandatory)*, User Story 1 - Create and View Tasks Manually (Priority: P1), User Story 2 - Prioritized Today View (Priority: P2), User Story 3 - Task Status Toggling, Checklist Progression & Editing (Priority: P3), User Story 4 - Categorization by Contexts (Priority: P4)

### Community 169 - "ChecklistItemsTable"
Cohesion: 0.50
Nodes (3): ChecklistItemsTable, ContextsTable, TasksTable

### Community 170 - "Multi-Flavor Versioning & Branch Promotion Rules"
Cohesion: 0.50
Nodes (3): 1. Branch Roles & Target Flavors, 2. Pre-Push Verification Checklist, Multi-Flavor Versioning & Branch Promotion Rules

### Community 172 - "Design Notes: Local Foundation & Task Management (Phase 1)"
Cohesion: 0.50
Nodes (3): Design Notes: Local Foundation & Task Management (Phase 1), Reconciliation Audit, Stitch Project Reference

### Community 173 - "Do's and Don'ts"
Cohesion: 0.67
Nodes (3): Do, Do's and Don'ts, Don't

## Knowledge Gaps
- **1379 isolated node(s):** `XCTest`, `initialRoute`, `initialRouteArgs`, `_sessionExpiredSubscription`, `createState` (+1374 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 2289 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **21 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `_` connect `_` to `connectivity_service.dart`, `item_remote_data_source.dart`, `app_exception.dart`, `example_screen.dart`, `example_detail_screen.dart`, `auth_interceptor.dart`, `package:injectable/injectable.dart`, `prefs_service.dart`, `app.dart`, `all_tasks_screen_golden_test.dart`, `example_cubit.dart`, `logging_interceptor.dart`, `bootstrap.dart`, `TasksCubit`, `update_required_screen.dart`?**
  _High betweenness centrality (0.025) - this node is a cross-community bridge._
- **What connects `XCTest`, `initialRoute`, `initialRouteArgs` to the rest of the system?**
  _1379 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `app_localizations.dart` be split into smaller, more focused modules?**
  _Cohesion score 0.014814814814814815 - nodes in this community are weakly interconnected._
- **Why does `AppDatabase` connect `all_tasks_screen_golden_test.dart` to `task_detail_screen_golden_test.dart`, `task_form_sheet.dart`, `storage/app_database.dart`, `_`, `task_local_data_source_impl.dart`, `task_form_sheet_golden_test.dart`, `today_screen_golden_test.dart`?**
  _High betweenness centrality (0.012) - this node is a cross-community bridge._
- **Should `app_localizations_ar.dart` be split into smaller, more focused modules?**
  _Cohesion score 0.016260162601626018 - nodes in this community are weakly interconnected._
- **Why does `TaskFormCubit` connect `TasksCubit` to `route_providers.dart`, `task_detail_screen_golden_test.dart`, `task_form_sheet.dart`, `example_screen.dart`, `today_screen.dart`, `task_form_state.dart`, `task_form_cubit.dart`, `_`, `all_tasks_screen_golden_test.dart`, `task_form_sheet_golden_test.dart`, `today_screen_golden_test.dart`?**
  _High betweenness centrality (0.011) - this node is a cross-community bridge._
- **Should `app_localizations_en.dart` be split into smaller, more focused modules?**
  _Cohesion score 0.016129032258064516 - nodes in this community are weakly interconnected._