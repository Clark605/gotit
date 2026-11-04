# Design Notes: Local Foundation & Task Management (Phase 1)

**Feature**: `specs/001-local-tasks` | **Date**: 2026-11-03

## Stitch Project Reference

- **Project ID**: `394000620935131887`
- **Total Screens Fetched**: 18 screens (Full light, dark, Arabic RTL, empty, validation, and modal states)
- **Local Asset Directory**: `specs/001-local-tasks/design/screens/`

| Screen File | Stitch Title | Verification Notes |
|-------------|--------------|-------------------|
| `01-today-english-light.png` | Gotit - Today (English Light) | Overdue, Due Today (all-day first), Start Today, green FAB, hairline dividers |
| `01-today-arabic-light.png` | Gotit - اليوم (Arabic RTL Light) | Flipped RTL layout, right-aligned checkboxes, left FAB, Eastern Arabic numerals |
| `01-today-empty-light.png` | Gotit - Today (English Empty State) | Single-color line illustration, calm prompt, "Add a task" button |
| `01-today-english-dark.png` | Gotit - Today (English Dark Theme) | Warm dark background (`#1C1B19`), surface (`#262522`), accent (`#4FBF98`) |
| `02-tasks-english-light.png` | Gotit - Tasks (English Light) | Context filter chips, segmented Active/Completed/All control, task rows |
| `02-tasks-completed-light.png` | Gotit - Tasks (Completed View Light) | Completed filter: green filled checkboxes, strikethrough muted titles |
| `02-tasks-arabic-light.png` | Gotit - المهام (Arabic RTL Light) | Arabic RTL catalog, mirrored filter chips, RTL segmented button |
| `02-tasks-english-dark.png` | Gotit - Tasks (English Dark Theme) | Dark mode catalog with proper contrast |
| `03-detail-english-light.png` | Gotit - Task Detail (English Light) | Context tag, title, schedule card, notes, interactive checklist |
| `03-detail-arabic-light.png` | Gotit - تفاصيل المهمة (Arabic RTL Light) | Arabic RTL detail screen, mirrored back chevron, checklist |
| `03-detail-english-dark.png` | Gotit - Task Detail (English Dark Theme) | Dark theme task detail |
| `04-form-english-light.png` | Gotit - New Task Modal Sheet (English Light) | 20px top corners, title input, date/all-day row, effort chips, checklist editor, green Save button |
| `04-form-validation-light.png` | Gotit - New Task Modal Sheet (Validation Error Light) | Empty title red error border (`#C92A2A`), inline warning, disabled Save button |
| `04-form-arabic-light.png` | Gotit - مهمة جديدة (Arabic RTL Light) | Arabic RTL bottom sheet form, mirrored controls and inputs |
| `04-form-english-dark.png` | Gotit - New Task Modal Sheet (English Dark Theme) | Dark mode bottom sheet form |
| `05-contexts-english-light.png` | Gotit - Manage Contexts (English Light) | Protected default contexts (Work, Home, Personal) with lock icons, custom tags |
| `05-contexts-delete-modal-light.png` | Gotit - Delete Context Confirmation (Light) | Alert confirming tasks kept & unassigned to "No Context" (Clarification Q3) |
| `05-contexts-arabic-light.png` | Gotit - إدارة التصنيفات (Arabic RTL Light) | Arabic RTL context management sheet |

---

## Reconciliation Audit

| Item | Finding | Recommendation |
|------|---------|----------------|
| **Spec Coverage** | All functional requirements (FR-001 through FR-010) and user stories (US1–US4) map cleanly to at least one screen and interaction state. | **Pass**: Full specification coverage verified. |
| **DESIGN.md Compliance** | Zero forbidden effects (no gradients, no glass, no pill-shaped primary buttons, no card dropshadows). Single accent green `#1F7A5C` used exclusively for primary Save, FAB, and completed checks. | **Pass**: 100% compliant with design system tokens and geometry. |
| **RTL & Localization** | Arabic screens mirror layout (leading checkboxes on right, trailing FAB/actions on left, right-aligned titles, Eastern Arabic date formats). | **Pass**: Equal citizen RTL support confirmed. |
| **Daily Progress Affordance** | Screen `02-tasks-english-light.png` renders a subtle "Daily Momentum" (completion percentage) card at bottom of list. | **Approved UI Affordance**: Implement as an optional `DailyProgressBanner` widget driven by `TasksState`. |
| **Context Safe Deletion** | Screen `05-contexts-delete-modal-light.png` explicitly confirms tasks are retained and unassigned to "No Context". | **Pass**: Matches Clarification Q3 decision precisely. |
