# Graph Report - gotit  (2026-11-03)

## Corpus Check
- 192 files · ~89,251 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 54 file(s) not represented in the graph (top: .xml 13, .ttf 8, (none) 7)

## Summary
- 2346 nodes · 2881 edges · 146 communities (129 shown, 17 thin omitted)
- Extraction: 99% EXTRACTED · 1% INFERRED · 0% AMBIGUOUS · INFERRED: 16 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `1a0803de`
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
- package:gotit/core/theme/app_spacing.dart
- route_providers.dart
- example_detail_event.dart
- AppDelegate
- app_button.dart
- connectivity_service.dart
- User Scenarios & Testing *(mandatory)*
- Mode: finalize
- Analysis & Synthesis Instructions
- connectivity_state.dart
- Stitch DESIGN.md Skill
- Architectural Blueprint
- app.dart
- pagination_state.dart
- rules
- result.dart
- example_screen.dart
- Execution Steps
- connectivity_cubit.dart
- example_detail_screen.dart
- auth_interceptor.dart
- push_notification_service.dart
- prefs_service.dart
- item_card.dart
- app_error_state.dart
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
- remote_config_service.dart
- app_navigator.dart
- update_required_screen.dart
- Core Principles
- manifest.json
- app_durations.dart
- 22. STYLE VARIATION ENGINE
- package:flutter/material.dart
- api_constants.dart
- 🎯 Gotit
- package:gotit/core/config/app_config.dart
- return
- flutter_native_splash
- Implementation Plan: [FEATURE]
- speckit-checklist/SKILL.md
- ActionGuard
- responsive_layout.dart
- 2. Supported Backend Variants
- 1. Design Tokens Scale
- storage_keys.dart
- package:injectable/injectable.dart
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
- State
- AppLocalizations
- 21. MOBILE ANTI-AI-TELLS RULE
- Backend Variant: Supabase
- ⚡ Getting Started
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
- 6. Functional Requirements
- crash_reporter.dart
- app_icon_size.dart
- breakpoints.dart
- BuildContext
- 5. Scope and Roadmap
- AppColorsExtension

## God Nodes (most connected - your core abstractions)
1. `_` - 42 edges
2. `CORE DIRECTIVE: PREMIUM MOBILE APP IMAGE DIRECTION` - 39 edges
3. `dependencies` - 17 edges
4. `Gotit: Product Requirements Document` - 16 edges
5. `Failure` - 15 edges
6. `Tasks: [FEATURE NAME]` - 13 edges
7. `rules` - 12 edges
8. `ExampleDetailEvent` - 12 edges
9. `Stitch DESIGN.md Skill` - 12 edges
10. `Core Principles` - 12 edges

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

## Communities (146 total, 17 thin omitted)

### Community 0 - "app_localizations.dart"
Cohesion: 0.02
Nodes (80): about, appTitle, appVersion, arabic, back, backOnlineText, cancel, close (+72 more)

### Community 1 - "app_localizations_ar.dart"
Cohesion: 0.03
Nodes (72): about, appTitle, appVersion, arabic, back, backOnlineText, cancel, close (+64 more)

### Community 2 - "app_localizations_en.dart"
Cohesion: 0.03
Nodes (72): about, appTitle, appVersion, arabic, back, backOnlineText, cancel, close (+64 more)

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
Cohesion: 0.06
Nodes (33): dependencies, connectivity_plus, dio, flutter, flutter_bloc, flutter_localizations, flutter_native_splash, flutter_secure_storage (+25 more)

### Community 11 - "Gotit: Product Requirements Document"
Cohesion: 0.11
Nodes (19): 10. Success Metrics, 11. Privacy and Security, 12. Non-Functional Requirements, 13. Risks and Mitigations, 14. Milestones (Rough), 15. Open Questions, 1. Overview, 2. Goals and Non-Goals (+11 more)

### Community 12 - "failure.dart"
Cohesion: 0.08
Nodes (28): cancelled, CancelledFailure, code, conflict, ConflictFailure, Failure, fieldErrors, forbidden (+20 more)

### Community 13 - "steps"
Cohesion: 0.06
Nodes (30): args, inputs, integration, spec, default, prompt, type, any (+22 more)

### Community 14 - "infinite_scroll_list.dart"
Cohesion: 0.10
Nodes (17): build, controller, _createdController, createState, dispose, emptyWidget, hasMore, initState (+9 more)

### Community 15 - "app_config.dart"
Cohesion: 0.07
Nodes (22): AppConfig, AppFlavor, applicationId, appName, baseUrl, connectTimeout, connectTimeoutSeconds, enableLogging (+14 more)

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
Nodes (20): autofocus, autovalidateMode, build, controller, createState, enabled, focusNode, hintText (+12 more)

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
Cohesion: 0.09
Nodes (6): _, GetItInjectableX, init, ForceUpdateGate, PrefsService, SecureStorageService

### Community 24 - "Flavors & Environment Configuration"
Cohesion: 0.08
Nodes (23): 1. Environment Files, 2. Running & Building per Flavor, 3. Native Setup, 4. Flavor-Specific App Icons, 5. Release Signing, Android (`android/app/build.gradle.kts`), CI/CD Secret Injection, Development (+15 more)

### Community 25 - "onboarding_screen.dart"
Cohesion: 0.07
Nodes (16): l10n, AppRouter, AuthRedirect, _fadeRoute, onGenerateRoute, build, errorMessage, ErrorScreen (+8 more)

### Community 26 - "example_cubit.dart"
Cohesion: 0.09
Nodes (15): createItem, loadItems, loadMore, _pageSize, refresh, _repository, createItem, getItem (+7 more)

### Community 27 - "logging_interceptor.dart"
Cohesion: 0.08
Nodes (16): AuthInterceptor, mapDioException, onError, onRequest, onResponse, SafeLoggingInterceptor, _sanitizeData, _sanitizeHeaders (+8 more)

### Community 28 - "DESIGN.md"
Cohesion: 0.09
Nodes (22): Accent, Accessibility, Colors, Components, Context tints, Dark theme (values to verify with a contrast check), Do, Do's and Don'ts (+14 more)

### Community 29 - "item_model.dart"
Cohesion: 0.17
Nodes (18): _, class, hashCode, id, identical, ItemModelPatterns, null, operator (+10 more)

### Community 30 - "app_logger.dart"
Cohesion: 0.09
Nodes (19): AppLogger, _cyan, debug, error, ExecutionTimer, _gray, info, _log (+11 more)

### Community 31 - "package:gotit/core/theme/app_spacing.dart"
Cohesion: 0.14
Nodes (13): ConnectivityCubit, ResponsiveLayout, AppAvatar, AppButton, AppDateField, AppErrorState, build, child (+5 more)

### Community 32 - "route_providers.dart"
Cohesion: 0.08
Nodes (12): buildErrorRoute, buildExampleDetailRoute, buildExampleRoute, buildMaintenanceRoute, buildNoInternetRoute, buildNotFoundRoute, buildOnboardingRoute, buildSettingsRoute (+4 more)

### Community 33 - "example_detail_event.dart"
Cohesion: 0.19
Nodes (17): _, class, ExampleDetailEventPatterns, hashCode, id, identical, null, operator (+9 more)

### Community 34 - "AppDelegate"
Cohesion: 0.11
Nodes (6): Flutter, AppDelegate, SceneDelegate, RunnerTests, UIKit, XCTest

### Community 35 - "app_button.dart"
Cohesion: 0.11
Nodes (15): AppButtonVariant, borderRadius, build, height, icon, isExpanded, isLoading, label (+7 more)

### Community 36 - "connectivity_service.dart"
Cohesion: 0.22
Nodes (6): _connectivity, ConnectivityService, _hasConnection, IConnectivityService, isConnected, onConnectivityChanged

### Community 37 - "User Scenarios & Testing *(mandatory)*"
Cohesion: 0.10
Nodes (18): Content Quality, Feature Readiness, Notes, Requirement Completeness, Specification Quality Checklist: Local Foundation & Task Management, Assumptions, Edge Cases, Feature Specification: Local Foundation & Task Management (+10 more)

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
Cohesion: 0.07
Nodes (25): 1. Branch Naming Conventions, 2. Commit Message Guidelines (Conventional Commits), 3. Architecture Rules & The 8 Golden Rules, 4. Mandatory Verification Pipeline, Contributing to `flutter_starter`, Examples:, Types:, 1. The Seam: Why There Is No Domain Layer (+17 more)

### Community 43 - "app.dart"
Cohesion: 0.07
Nodes (28): build, createState, dispose, initialRoute, initialRouteArgs, initState, _sessionExpiredSubscription, StarterApp (+20 more)

### Community 44 - "pagination_state.dart"
Cohesion: 0.11
Nodes (16): copyWith, failure, hasMore, isEmpty, isLoadingFirstPage, isLoadingMore, isNotEmpty, itemCount (+8 more)

### Community 45 - "rules"
Cohesion: 0.12
Nodes (16): analyzer, exclude, include, linter, rules, always_use_package_imports, avoid_catches_without_on_clauses, avoid_print (+8 more)

### Community 46 - "result.dart"
Cohesion: 0.15
Nodes (13): data, Error, failure, failureOrNull, getOrElse, getOrNull, hashCode, isFailure (+5 more)

### Community 47 - "example_screen.dart"
Cohesion: 0.14
Nodes (7): ExampleCubit, build, _buildList, _buildSkeleton, ExampleScreen, _showCreateBottomSheet, injectable

### Community 48 - "Execution Steps"
Cohesion: 0.12
Nodes (15): 1. Initialize Convergence Context, 2. Load Artifacts (Progressive Disclosure), 3. Build the Intent Inventory, 4. Assess the Codebase and Classify Findings, 5. Assign Severity, 6. Present the In-Session Findings Summary, 7. Append Convergence Tasks (or report converged), 8. Provide Next Actions (Handoff) (+7 more)

### Community 49 - "connectivity_cubit.dart"
Cohesion: 0.11
Nodes (11): close, _connectivityService, _init, refresh, _subscription, clearMappers, CustomErrorMapper, _customMappers (+3 more)

### Community 50 - "example_detail_screen.dart"
Cohesion: 0.14
Nodes (11): emit, ExampleDetailBloc, _onLoad, _onRefresh, _repository, ExampleDetailEvent, build, _buildContent (+3 more)

### Community 51 - "auth_interceptor.dart"
Cohesion: 0.13
Nodes (11): notifySessionExpired, onError, onRequest, onSessionExpired, _sessionExpiredController, _tokenProvider, getAccessToken, getRefreshToken (+3 more)

### Community 52 - "push_notification_service.dart"
Cohesion: 0.13
Nodes (12): IAnalyticsService, logEvent, NoOpAnalyticsService, setCurrentScreen, setUserId, setUserProperty, getToken, init (+4 more)

### Community 53 - "prefs_service.dart"
Cohesion: 0.12
Nodes (13): clearAll, getBool, getLocaleCode, getString, getThemeMode, hasSeenOnboarding, _prefs, remove (+5 more)

### Community 54 - "item_card.dart"
Cohesion: 0.25
Nodes (4): build, item, ItemCard, onTap

### Community 55 - "app_error_state.dart"
Cohesion: 0.11
Nodes (16): AppEmptyState, build, ctaText, description, icon, onCtaPressed, title, build (+8 more)

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
Cohesion: 0.09
Nodes (21): build, _buildBottomNavPreview, _buildButtonsSection, _buildColorGrid, _buildContextTagsSection, _buildEmptyStatePreview, _buildFilterChipsSection, _buildInputsSection (+13 more)

### Community 60 - "bootstrap.dart"
Cohesion: 0.09
Nodes (12): bootstrap, initialRoute, initialRouteArgs, isCrashReporterReady, preInitErrors, startupTimer, widgetsBinding, ActionGuardConfig (+4 more)

### Community 61 - "route_names.dart"
Cohesion: 0.13
Nodes (14): error, example, exampleDetail, home, initial, maintenance, noInternet, notFound (+6 more)

### Community 62 - "package:gotit/core/theme/app_spacing.dart"
Cohesion: 0.11
Nodes (12): buildDarkTheme, colorScheme, textTheme, buildLightTheme, colorScheme, textTheme, AppErrorBanner, build (+4 more)

### Community 63 - "check_architecture.dart"
Cohesion: 0.14
Nodes (13): allowedCoreFeatureImporters, current, dartFiles, false, importRegex, importUri, _isIgnored, libDir (+5 more)

### Community 64 - "Agent Guidelines & Engineering Standards"
Cohesion: 0.15
Nodes (13): 10. Git Workflow, 11. Definition of Done, 1. Project Overview, 2. Architecture & The 8 Golden Rules, 3. Directory Map (`lib/core/`), 4. Mandatory New-Feature Checklist (Spec-Driven & Design-First), 5. Reference Implementation, 6. Naming Conventions (+5 more)

### Community 65 - "app_avatar.dart"
Cohesion: 0.15
Nodes (10): backgroundColor, border, build, imageUrl, _isUnassigned, name, size, textColor (+2 more)

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
Nodes (8): build, firstDate, label, lastDate, onDateSelected, placeholder, _selectDate, selectedDate

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
Cohesion: 0.18
Nodes (8): check, GateCheckResult, GateStatus, isBlocked, _isVersionBelow, _remoteConfig, status, updateUrl

### Community 77 - "example_state.dart"
Cohesion: 0.22
Nodes (16): _, class, ExampleStatePatterns, hashCode, identical, _items, null, operator (+8 more)

### Community 78 - "remote_config_service.dart"
Cohesion: 0.20
Nodes (9): _defaults, fetchAndActivate, getBool, getDouble, getInt, getString, init, IRemoteConfigService (+1 more)

### Community 79 - "app_navigator.dart"
Cohesion: 0.18
Nodes (6): AppNavigator, canPop, currentContext, currentState, navigatorKey, resetKeyForTesting

### Community 80 - "update_required_screen.dart"
Cohesion: 0.18
Nodes (6): build, _copyToClipboard, _effectiveUrl, _openUpdateUrl, UpdateRequiredScreen, updateUrl

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

### Community 85 - "package:flutter/material.dart"
Cohesion: 0.33
Nodes (3): AppTheme, dark, light

### Community 86 - "api_constants.dart"
Cohesion: 0.20
Nodes (8): ApiConstants, baseUrl, itemDetail, items, login, logout, refresh, register

### Community 87 - "🎯 Gotit"
Cohesion: 0.20
Nodes (10): 📊 AI Prompt & Extraction Evaluation, 🔮 Future Roadmap, 🎯 Gotit, 📄 Governance & Standards, ⚖️ License, 🚀 PRD Feature Scope, 🔒 Privacy & Architecture Principles, 🏛️ Technical Stack & Architecture (+2 more)

### Community 88 - "package:gotit/core/config/app_config.dart"
Cohesion: 0.22
Nodes (3): dio, DioModule, PrefsModule

### Community 89 - "return"
Cohesion: 0.22
Nodes (3): false, isSocketErrorImpl, main

### Community 90 - "flutter_native_splash"
Cohesion: 0.22
Nodes (8): color, image, flutter_native_splash, android, android_12, color, image, ios

### Community 91 - "Implementation Plan: [FEATURE]"
Cohesion: 0.22
Nodes (8): Complexity Tracking, Constitution Check, Documentation (this feature), Implementation Plan: [FEATURE], Project Structure, Source Code (repository root), Summary, Technical Context

### Community 92 - "speckit-checklist/SKILL.md"
Cohesion: 0.25
Nodes (7): Anti-Examples: What NOT To Do, Checklist Purpose: "Unit Tests for English", Example Checklist Types & Sample Items, Execution Steps, Post-Execution Checks, Pre-Execution Checks, User Input

### Community 94 - "responsive_layout.dart"
Cohesion: 0.17
Nodes (9): build, desktop, isDesktop, isMobile, isTablet, mobile, screenHeight, screenWidth (+1 more)

### Community 95 - "2. Supported Backend Variants"
Cohesion: 0.25
Nodes (7): 1. The Seam: `I<Feature>Repository`, 2. Supported Backend Variants, A. REST via Dio (Default), B. Cloud Firestore (Firebase), Backend-Agnostic Architecture & Swap Points, C. Supabase, D. GraphQL

### Community 96 - "1. Design Tokens Scale"
Cohesion: 0.25
Nodes (7): 1. Design Tokens Scale, 2. Locale-Aware Typography, 3. Semantic Theme Extensions (`AppColorsExtension`), Animation Durations & Curves (`AppDurations`), Design Tokens & Theming System, Radii (`AppRadius`), Spacing (`AppSpacing`)

### Community 97 - "storage_keys.dart"
Cohesion: 0.22
Nodes (7): accessToken, hasSeenOnboarding, locale, refreshToken, StorageKeys, themeMode, userId

### Community 98 - "package:injectable/injectable.dart"
Cohesion: 0.12
Nodes (7): _loadPackageInfo, _prefs, setLocale, setThemeMode, toggleThemeMode, configureDependencies, getIt

### Community 99 - "app_typography.dart"
Cohesion: 0.10
Nodes (17): AppTypography, arabicFontFamily, body, bodyMedium, bodySm, button, caption, captionBold (+9 more)

### Community 100 - "validators.dart"
Cohesion: 0.25
Nodes (6): email, _emailRegex, FormValidators, matches, minLength, requiredField

### Community 101 - "item_remote_data_source.dart"
Cohesion: 0.25
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
Cohesion: 0.29
Nodes (4): Additional Security & Data Constraints, Gotit Constitution, Governance, Quality Gates & Verification Standards

### Community 106 - "setup_env.dart"
Cohesion: 0.29
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

### Community 110 - "State"
Cohesion: 0.27
Nodes (8): AppTextField, _AppTextFieldState, InfiniteScrollList, _InfiniteScrollListState, OnboardingScreen, _OnboardingScreenState, ThemeGalleryScreen, _ThemeGalleryScreenState

### Community 111 - "AppLocalizations"
Cohesion: 0.33
Nodes (5): AppLocalizations, _AppLocalizationsDelegate, AppLocalizationsAr, AppLocalizationsEn, of

### Community 112 - "21. MOBILE ANTI-AI-TELLS RULE"
Cohesion: 0.40
Nodes (5): 21. MOBILE ANTI-AI-TELLS RULE, Copy AI tells, Layout AI tells, UI clutter tells, Visual AI tells

### Community 113 - "Backend Variant: Supabase"
Cohesion: 0.40
Nodes (4): 1. Dependencies to Add to `pubspec.yaml`, 2. Initialization & Error Mapping, 3. Architecture Swap Point, Backend Variant: Supabase

### Community 114 - "⚡ Getting Started"
Cohesion: 0.40
Nodes (5): 1. Prerequisites, 2. Set Up Environment, 3. Dependencies & Code Generation, 4. Run the Dev Flavor, ⚡ Getting Started

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
Cohesion: 0.22
Nodes (9): dev_dependencies, build_runner, flutter_launcher_icons, flutter_lints, flutter_test, freezed, injectable_generator, json_serializable (+1 more)

### Community 139 - "6. Functional Requirements"
Cohesion: 0.25
Nodes (8): 6.1 Capture, 6.2 Extraction, 6.3 Tasks and Today view, 6.4 Reminders, 6.5 Widget, 6.6 Account and sync, 6.7 Limits, 6. Functional Requirements

### Community 140 - "crash_reporter.dart"
Cohesion: 0.29
Nodes (7): ICrashReporter, init, log, NoOpCrashReporter, recordError, setCustomKey, setUserId

### Community 141 - "app_icon_size.dart"
Cohesion: 0.25
Nodes (7): AppIconSize, lg, md, sm, xl, xs, xxl

### Community 142 - "breakpoints.dart"
Cohesion: 0.29
Nodes (5): Breakpoints, desktop, largeDesktop, mobile, tablet

### Community 143 - "BuildContext"
Cohesion: 0.40
Nodes (4): LocalizationContextExtension, AppColorsExtensionContext, ResponsiveContextExtension, AppSnackBarExtension

### Community 144 - "5. Scope and Roadmap"
Cohesion: 0.40
Nodes (5): 5. Scope and Roadmap, Later, v1 (MVP), v2, v3

## Knowledge Gaps
- **957 isolated node(s):** `XCTest`, `initialRoute`, `initialRouteArgs`, `_sessionExpiredSubscription`, `createState` (+952 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 1728 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **17 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `_` connect `_` to `package:injectable/injectable.dart`, `connectivity_service.dart`, `item_remote_data_source.dart`, `app.dart`, `crash_reporter.dart`, `remote_config_service.dart`, `example_screen.dart`, `example_detail_screen.dart`, `auth_interceptor.dart`, `push_notification_service.dart`, `prefs_service.dart`, `example_cubit.dart`, `logging_interceptor.dart`, `package:gotit/core/theme/app_spacing.dart`?**
  _High betweenness centrality (0.023) - this node is a cross-community bridge._
- **What connects `XCTest`, `initialRoute`, `initialRouteArgs` to the rest of the system?**
  _957 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `app_localizations.dart` be split into smaller, more focused modules?**
  _Cohesion score 0.023529411764705882 - nodes in this community are weakly interconnected._
- **Why does `ExampleDetailBloc` connect `example_detail_screen.dart` to `route_providers.dart`, `example_detail_state.dart`, `example_screen.dart`, `_`, `ActionGuard`?**
  _High betweenness centrality (0.009) - this node is a cross-community bridge._
- **Should `app_localizations_ar.dart` be split into smaller, more focused modules?**
  _Cohesion score 0.0273972602739726 - nodes in this community are weakly interconnected._
- **Why does `ConnectivityCubit` connect `package:gotit/core/theme/app_spacing.dart` to `connectivity_state.dart`, `connectivity_cubit.dart`, `app.dart`, `_`?**
  _High betweenness centrality (0.009) - this node is a cross-community bridge._
- **Should `app_localizations_en.dart` be split into smaller, more focused modules?**
  _Cohesion score 0.02702702702702703 - nodes in this community are weakly interconnected._