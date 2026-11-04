---
trigger: always_on
description: Enforce structured Conventional Commit format with feature/layer scopes and bulleted technical details.
---

# Commit Message Instructions

Generate structured **Conventional Commits** adhering strictly to this standard:

---

## Format

```text
<type>(<feature>/<layer>): <imperative subject (max 72 chars, no period)>

- <Bullet point detailing what changed>
- <Technical detail: classes, cubits, widgets, tables, or migrations>
- <Rationale, edge cases, or breaking change notes>

<Optional closing summary of impact/value>
```

> **Note:** When a change spans an entire feature across layers, use `<type>(<feature>):`. For shared core modules, use `<type>(core/<module>):` (e.g. `core/storage`, `core/routes`, `core/theme`, `core/network`). For cross-cutting repo tooling/docs, use `docs`, `ci`, or `scripts`.

---

## Types & Scopes

| Type | When to Use |
| :--- | :--- |
| `feat` | New feature, widget, or state capability |
| `fix` | Bug fix or error resolution |
| `refactor` | Code restructuring without behavioral changes |
| `perf` | Performance optimization or query tuning |
| `test` | Adding or updating tests (unit, bloc, widget, golden) |
| `docs` | Documentation, PRD, spec, or architecture updates |
| `chore` | Build scripts, dependencies, CI/CD, codegen, configs |
| `style` | Formatting, linting, whitespace |

### Scope Structure: `<feature>/<layer>`
- **Features (`<feature>`):** Feature directory name under `lib/features/` (e.g., `tasks`, `auth`, `settings`).
- **Layers (`<layer>`):** Architectural layer within the feature:
  - `data` (models, datasources, repositories)
  - `cubit` or `bloc` (state, cubit, action guards)
  - `ui` (screens, widgets, form sheets, cards)
- **Core Modules (`core/<module>`):** `core/storage`, `core/routes`, `core/theme`, `core/network`, `core/di`, `core/l10n`, `core/errors`
- **Cross-cutting:** `docs`, `ci`, `scripts`, `graph`

---

## Rules
1. **Feature & Layer in Scope:** Use `<feature>/<layer>` (e.g. `feat(tasks/ui):`, `fix(tasks/data):`, `refactor(tasks/cubit):`).
2. **Imperative Subject:** Use present-tense imperative mood (e.g. `add`, `fix`, `refactor` — not `added`, `fixes`).
3. **Subject Length:** Maximum 72 characters, lowercase type/scope, no trailing period.
4. **Atomic Focus:** One logical change per commit.
5. **Body Bullets:** Detail the *what* and *why* with specific symbols/files changed:
   - Bullet 1: Summary of what changed.
   - Bullet 2: Specific classes, widgets, cubits, tables, or contracts touched.
   - Bullet 3: Rationale, edge cases handled, or behavior verified.
6. **Breaking Changes:** Prefix with `⚠️ BREAKING:` or `BREAKING CHANGE:`.

---

## Examples

### UI Layer Feature
```text
feat(tasks/ui): implement Today view sections and task card widgets

- Add TodayScreen with Overdue, Due Today, and Start Today sections
- Implement TaskCard with 24px circular checkbox in 48dp touch target
- Integrate AddButton FAB and BottomNavBar with hairline border

Delivers primary dashboard matching approved Stitch mockups in light and dark themes.
```

### Cubit Layer Feature
```text
feat(tasks/cubit): implement TasksCubit and TaskFormCubit with ActionGuard

- Add TasksCubit with reactive subscriptions to Today and catalog streams
- Add TaskFormCubit with title validation, effort picker, and checklist drafting
- Wrap all async operations in ActionGuard with duplicate action rejection
```

### Data Layer Bug Fix
```text
fix(tasks/data): trigger parent task update on checklist toggle

- Touch tasksTable.updatedAt inside toggleChecklistItem transaction
- Resolve stream watcher notification issue for SQLite joins
- Ensure parent task progress recalculates automatically on checkoff
```
