# Design Notes: Resilient Task Reminders & Notifications (Phase 2)

**Created**: 2026-11-04  
**Feature**: [spec.md](../spec.md) | **Plan**: [plan.md](../plan.md)

---

## 1. Design Decisions

1. **Integrated Form Sheet Section**: Rather than creating a separate modal for reminders, the reminder toggle and lead time chips live directly inside `TaskFormSheet` immediately below the effort picker. This maintains Gotit's principle of fast single-view task creation without nested sub-screens.
2. **Pre-Permission Trust Primer**: In accordance with Constitution Principle V, permissions must never be requested abruptly. `PermissionPrimerDialog` establishes on-device privacy and explains exact alarm requirements before the OS modal is displayed.
3. **Dedicated OEM Troubleshooting Screen**: Aggressive battery savers on Android OEMs (Xiaomi, Samsung, Huawei) represent the #1 failure mode for mobile alarms. Providing an accessible `ReminderTroubleshootingScreen` with direct deep-links to system battery settings ensures high delivery reliability.
4. **Subtle Card Badge**: Instead of visual clutter, tasks with scheduled reminders feature a compact 13px bell icon and lead-time label (e.g. `🔔 15m`) positioned next to the due time in `TaskCard`.

---

## 2. Review & Reconciliation Against DESIGN.md and Specs

All 14 generated frames were retrieved from Stitch project `projects/394000620935131887` and verified against `DESIGN.md` and `specs/002-task-reminders/spec.md`:

| Screen Asset | Title & Frame | DESIGN.md Compliance | Spec Coverage | Finding / Verdict |
| :--- | :--- | :---: | :---: | :--- |
| `01-reminders-modal-en-light.png` | Reminders Modal (En Light) | ✅ PASS | FR-001, FR-002, US1 | `#FCFBF9` canvas, `#1F7A5C` active switch and selected `15m` chip. Dynamic start-working notice rendered. |
| `01-reminders-modal-ar-light.png` | Reminders Modal (Ar Light) | ✅ PASS | FR-001, FR-013, US1 | Full RTL layout mirroring. Arabic labels (`تذكيري`, `قبل ١٥ دقيقة`) with IBM Plex Sans Arabic. |
| `01-reminders-modal-en-dark.png` | Reminders Modal (En Dark) | ✅ PASS | FR-001, US1 | `#161513` dark canvas, `#22201C` surface, `#4FBF98` dark green accent. High contrast. |
| `01-reminders-modal-inexact-warning.png` | Reminders Modal (Inexact State) | ✅ PASS | FR-009, US4 | Amber `#FAF0C8` subtle warning banner explaining inexact timing with direct link to settings. |
| `02-permission-primer-en-light.png` | Permission Primer (En Light) | ✅ PASS | FR-008, US4 | 20px sheet top corners, `#DDF0E7` bell icon container, `#1F7A5C` 48dp CTA, on-device privacy claim. |
| `02-permission-primer-ar-light.png` | Permission Primer (Ar Light) | ✅ PASS | FR-008, FR-013, US4 | Full RTL mirroring, natural Arabic phrasing (*"لا تفوّت أي التزام"*), no letter distortion. |
| `02-permission-primer-en-dark.png` | Permission Primer (En Dark) | ✅ PASS | FR-008, US4 | `#2D2C29` raised surface, `#1B382B` container, accessible contrast. |
| `03-reminder-reliability-en-light.png` | Reminder Reliability (En Light) | ✅ PASS | FR-010, US4 | Diagnostic status badges (Notifications, Exact Alarms, Battery Saver), OEM instructions for Samsung, Xiaomi, Huawei, Pixel. |
| `03-reminder-reliability-ar-light.png` | دقة التنبيهات (Ar Light) | ✅ PASS | FR-010, FR-013, US4 | Arabic RTL with localized OEM brand steps and system deep-link CTA. |
| `03-reminder-reliability-en-dark.png` | Reminder Reliability (En Dark) | ✅ PASS | FR-010, US4 | Clean dark theme typography and hairline dividers (`#3A3834`). |
| `04-notification-cards-light.png` | Notification Cards (Light Shade) | ✅ PASS | FR-007, FR-011, FR-012, US1-3 | M3 Android shade styling. 3 variants: Due alert (with Mark Done & Snooze 15m), Start-working alert, and 3-item Missed Reminders bundle. |
| `04-notification-cards-dark.png` | Notification Cards (Dark Shade) | ✅ PASS | FR-007, FR-011, FR-012, US1-3 | Dark Android system notification shade with crisp action labels. |
| `05-task-card-reminder-en.png` | TaskCard Indicator (En LTR) | ✅ PASS | FR-001, US1 | Subtle `🔔 15m` pill alongside due time; preserves 24px checkbox in 48x48dp target. |
| `05-task-card-reminder-ar.png` | TaskCard Indicator (Ar RTL) | ✅ PASS | FR-001, FR-013, US1 | RTL mirrored task card with bell tag and context chip. |

---

## 3. Deviations from Core DESIGN.md

- **Status**: **ZERO DEVIATIONS**.
- Accent `#1F7A5C` is strictly reserved for the primary CTA, active reminder toggle switch, and checked state.
- All interactive elements adhere to >= 48x48dp touch boundaries.
- No gradients, glassmorphism, or artificial drop shadows exist across any screen.

---

## 4. Stitch Project Metadata

- **Project ID**: `projects/394000620935131887`
- **Project Name**: Gotit Android Design System
- **Approved Assets Location**: `specs/002-task-reminders/design/screens/`
