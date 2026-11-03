# Research: Local Foundation & Task Management (Phase 1)

**Feature**: `specs/001-local-tasks` | **Date**: 2026-11-03

## 1. Local Database & ORM Selection: Drift vs SQLite vs Isar vs Hive

### Decision
Adopt **Drift** (`drift: ^2.24.2`, `drift_flutter: ^0.2.4`, `drift_dev: ^2.24.2`) with SQLite as the authoritative local persistence layer.

### Rationale
- **Constitution Compliance**: Principle III specifically designates Drift as the authoritative source of truth.
- **Type Safety & Reactivity**: Drift provides compile-time query verification, reactive `Stream` watches for queries, and native migrations.
- **Relational Integrity**: Tasks have hierarchical checklist items and foreign relationships to contexts. Drift easily enforces foreign keys (such as `SET NULL` when a custom context is deleted, per Clarification Q3) and indexes.
- **Future Sync Compatibility**: In Phase 5, background synchronization with Supabase requires tracking `updatedAt` timestamps and soft deletes (`isDeleted`). Relational SQLite handles upserts, change tracking, and tombstone soft-deletion with standard SQL semantics.
- **Template Alignment**: The repository includes `optional_modules/local_db/` pre-architected specifically for Drift.

### Alternatives Considered
- **sqflite directly**: Raw SQL strings lack compile-time safety and require tedious boilerplate for schema mapping and stream subscriptions.
- **Isar / Hive**: NoSQL key-value/document stores lack relational foreign keys (`SET NULL`), have uncertain long-term maintenance (Isar v3/v4), and make SQL-compatible last-write-wins sync with Supabase PostgreSQL more fragile.

---

## 2. Dynamic Start Date Derivation vs Explicit Start Time

### Decision
Derive "Start Today" eligibility dynamically at query time:
`is_start_today = (due_date > now) AND (effort_minutes IS NOT NULL) AND ((due_date - effort_minutes) <= end_of_today)`

### Rationale
- **User Experience (Clarification Q1)**: Avoids forcing users to manually enter a redundant "Start Date" during quick task capture. Tasks only need a `due_date` and an optional `effort_minutes` (e.g. 120 mins).
- **PRD Alignment**: PRD Section 6.4 (FR-15) explicitly states that when an effort estimate is set, start-working reminders trigger before due time. Using `due_date - effort_minutes` provides consistency between the Today view and upcoming reminder triggers.
- **Database Efficiency**: Can be indexed on `dueDate` and filtered in memory or SQLite using computed datetime expressions.

### Alternatives Considered
- **Dedicated `start_date` column**: Rejected because it complicates the task creation form and manual entry speed (violating SC-001 < 15s creation target).
- **Hardcoded 1-day lead threshold**: Rejected because a 15-minute task shouldn't appear days in advance, whereas a 6-hour task needs early lead time.

---

## 3. Today View Grouping & Sorting Strategy

### Decision
Order tasks in the Today view deterministically:
1. **Section 1: Overdue** (open tasks where `dueDate < start_of_today`)
2. **Section 2: Due Today** (open tasks where `dueDate >= start_of_today AND dueDate <= end_of_today`)
3. **Section 3: Start Today** (open tasks where `dueDate > end_of_today` AND `dueDate - effort <= end_of_today`)

Within each section:
- **All-day tasks** (`isAllDay == true`) appear first, sorted alphabetically by `title` (Clarification Q4).
- **Timed tasks** (`isAllDay == false`) follow, sorted chronologically ascending by `dueDate`.

### Rationale
- Gives immediate visibility to broad whole-day tasks before presenting the detailed hourly agenda.
- Guarantees predictable, non-flickering UI layout conforming to SC-002 (< 100ms render time) and SC-004 (< 50ms status toggle).

### Alternatives Considered
- **Timed tasks first**: Placing timed tasks before all-day tasks can bury critical all-day obligations beneath a long hourly list.
- **Treating all-day as 23:59**: Groups all-day tasks at the bottom of the screen, reducing their visibility until evening.

---

## 4. State Management & Layer Boundaries (8 Golden Rules)

### Decision
Follow the `lib/features/tasks/` structure strictly:
- **`data/models/`**: `TaskModel`, `ChecklistItemModel`, `ContextModel` (Freezed models with JSON serialization).
- **`data/datasources/`**: `TaskLocalDataSource` (abstract interface + Drift-backed implementation `TaskLocalDataSourceImpl`).
- **`data/repositories/`**: `TaskRepository` interface and `TaskRepositoryImpl`.
- **`cubit/`**: `TasksCubit` (extending `BaseCubit<TasksState>`) for list/today queries and mutations, and `TaskFormCubit` for create/edit operations. Both use `ActionGuard` for async safety.
- **`ui/`**: Thin screens consuming Cubits via `BlocBuilder` / `BlocConsumer`. UI never touches Drift, repositories, or DI.

### Rationale
- Conforms 100% to Constitution Principle VI and `AGENTS.md`.
- Repositories return plain `Future<T>`. All data access throws, while `guard()` in the Cubit encapsulates error mapping into `Failure`.
- State classes use single Freezed classes with `LoadStatus status`, data fields, and `Failure? failure`.

---

## 5. Dependency Additions Justification

| Dependency | Purpose | Constitution Principle VII Justification |
|------------|---------|-------------------------------------------|
| `drift: ^2.24.2` | Core reactive SQLite ORM | Mandatory per Constitution Principle III (authoritative local database) |
| `drift_flutter: ^0.2.4` | Flutter platform connection for Drift database | Official Drift wrapper providing database location & isolates |
| `drift_dev: ^2.24.2` *(dev)* | Code generation for Drift schema & DAOs | Required dev tool for type-safe Drift queries |
| `uuid: ^4.5.1` | Local primary key generation | Generates standard UUIDv4 strings for offline task identity (essential for future sync) |
