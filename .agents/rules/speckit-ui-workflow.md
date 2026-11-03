---
trigger: always_on
description: Enforces the design-first Spec Kit lifecycle incorporating Graphify, speckit-ui, DESIGN.md, and StitchMCP before implementation.
---

## Spec Kit Design-First & Architecture Workflow

For every new feature, phase, or specification in Gotit, follow this strict lifecycle sequence:

### 1. Specification (`/speckit-specify`)
- Create `specs/<feature>/spec.md` focusing strictly on user requirements, user stories (P1, P2, P3...), edge cases, and testable acceptance scenarios (Given/When/Then).
- Keep requirements technology-agnostic (no frameworks or database specifics in user stories).

### 2. Clarification (`/speckit-clarify`)
- Identify underspecified areas, resolve ambiguities, and encode decisions directly into `spec.md`.

### 3. Architecture & Planning with Graphify (`/speckit-plan`)
- **Graphify Codebase Inspection**: Before writing `plan.md`, use the Graphify knowledge graph (`query_graph` / `get_neighbors` / `graphify query` / `shortest_path`) to understand existing class relationships, repositories, route providers, and core utilities. Never guess how dependencies connect.
- Generate `specs/<feature>/plan.md` defining the data model, repository contracts, and architecture.
- Pass the mandatory **Constitution Check** gate.

### 4. UI Design Stage (`speckit-ui brief`)
- Invoke `speckit-ui` in `brief` mode to generate `specs/<feature>/design/ui-brief.md` and `stitch-prompts.md`.
- Adhere strictly to the repository root `DESIGN.md` (tokens, radius, spacing, typography, light/dark mode, Arabic RTL rules).
- Use `StitchMCP` to create the project (`gotit-<feature>`) and generate visual screens one by one.
- **Handoff for Human Review**: Present prompts and generated screens for user review and approval in `specs/<feature>/design/screens/`.

### 5. UI Finalization & Plan Synchronization (`speckit-ui finalize`)
- Run `speckit-ui` in `finalize` mode after screen approval.
- Reconcile approved screenshots against `spec.md` and `DESIGN.md`.
- Update `spec.md` with design references (screen-to-FR mapping).
- Update `plan.md` with:
  - Screen-to-widget breakdown (widgets, Cubits, state classes under `data/`, `cubit/`, `ui/`).
  - Shared design tokens and reusable widgets.
  - Test plan (golden tests in light, dark, Arabic RTL, and large text).

### 6. Task Generation (`/speckit-tasks`)
- Generate `specs/<feature>/tasks.md` ordered by dependencies.
- Ensure tasks cover both backend/data contracts and the finalized UI widget tree derived from the approved screens.

### 7. Implementation & Graphify Update (`/speckit-implement`)
- Execute implementation tasks strictly following the approved design and plan.
- **Maintain Documentation & Graph Integrity**: After modifying code files, run `graphify update .` to update `graphify-out/graph.json` without API cost.
- Run `dart format .`, `flutter analyze`, and `dart run tool/check_architecture.dart` before marking any task complete.
