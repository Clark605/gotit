# Gotit: Product Requirements Document

Draft v0.1 · Author: Clark · November 3, 2026

## 1. Overview

**One-line pitch:** Share any messy text, screenshot, or voice note to the app, and AI turns it into a clean task with a due date and a reminder, confirmed in one tap.

**Problem.** Commitments arrive scattered across WhatsApp, email, screenshots, and conversations. People copy them into a notes app by hand, forget, or never write them down. Existing task apps assume the user already has a clean task in their head.

**Solution.** An automation-first task app. The user triggers capture by sharing from any app, and the app does the structuring: title, due date, context, notes, and a checklist. The user reviews a confirm card and saves. Local reminders then fire at the right time.

**Why this scope.** An earlier concept (automatic background reading of chats) was dropped because permissions, Play Store policy, privacy, and device coverage made it too large. Gotit keeps the automation value but makes capture user-triggered, which removes risky permissions and works on both Android and iOS.

## 2. Goals and Non-Goals

### Goals

- G1: Capture a task from shared content in under 10 seconds from the moment of sharing to a saved task.
- G2: Extract title and due date correctly for a large majority of real English and Arabic messages (targets in section 10).
- G3: Deliver reminders reliably on Android, including after reboot.
- G4: Work offline for everything except extraction, with sync when online.
- G5: Serve as a portfolio piece that demonstrates technologies not used in earlier projects (section 7).

### Non-goals (v1)

- Automatic reading of notifications, chats, or the screen in the background.
- Team or shared task lists.
- Calendar sync.
- On-device LLM extraction.
- Receipt or expense tracking.
- Web or desktop clients.

## 3. Target Users

**Primary: busy students and young professionals** who receive tasks and deadlines through chat apps and email and track them informally. Mixed Arabic and English messages are common.

**Persona A, Sara (final-year student).** Deadlines are posted in WhatsApp groups. She screenshots them and forgets. She wants one place showing what is due and when to start.

**Persona B, Omar (junior developer).** Requests arrive in Slack and WhatsApp. He promises things verbally and in chat, and wants a quick way to log them.

## 4. User Stories

1. As a user, I share a message from WhatsApp to the app and see a pre-filled task so I do not retype it.
2. As a user, I share a screenshot of a deadline and get the task extracted from the image text.
3. As a user, I review the extracted fields on a confirm card and fix anything wrong before saving.
4. As a user, I see a Today list of what is due and what to work on.
5. As a user, I get a reminder before something is due, and a start-working reminder when the task needs lead time.
6. As a user, I add a task from a home-screen widget in two taps.
7. As a user, I use the app without internet and have my tasks sync when I reconnect.
8. As a user, I know exactly what data is sent to the AI and can delete my account and data.

## 5. Scope and Roadmap

### v1 (MVP)

- Share target (text and images) into the app
- AI extraction through a backend function
- Confirm card with edit and save
- Manual add task
- Task list with a Today view
- Local notifications (due reminders and start-working reminders)
- Contexts (Work, Home, Personal, custom)
- Auth and cloud backup sync
- Android home-screen widget for quick add

### v2

- Voice note to multiple tasks (speech-to-text feeding the same extraction)
- Waiting-on list (things others promised you)

### v3

- Receipt or bill photo to expense entry (on-device OCR)

### Later

- Auto-planned day that slots tasks into free time
- Recurring life templates
- Opt-in automatic capture

## 6. Functional Requirements

### 6.1 Capture

- FR-1: The app registers as a share target for plain text and images on Android; iOS share extension is a later milestone.
- FR-2: Shared images are processed with on-device OCR (ML Kit) and only the extracted text is sent to the backend, never the image.
- FR-3: Manual add supports title, due date and time, context, notes, and checklist items.
- FR-4: Capture opens directly on the confirm card, not on the main app.

### 6.2 Extraction

- FR-5: The app sends the shared text, the current date and time, the device timezone, and the locale to the backend extraction function.
- FR-6: The function returns strict JSON following the schema in section 8, and the client validates it before display.
- FR-7: If the model returns malformed output, the function retries once, then returns an error and the app falls back to a prefilled manual form with the raw text in notes.
- FR-8: One shared message can produce multiple tasks. The confirm card lists each with its own save or discard control.
- FR-9: Fields the model is unsure about are visually marked on the confirm card.
- FR-10: Relative dates in English and Arabic (for example tomorrow, next Thursday, الخميس, بعد بكرة) resolve against the device date and timezone.

### 6.3 Tasks and Today view

- FR-11: Tasks have status (open, done), due date and time or all-day, context, notes, checklist, effort estimate (optional), and source excerpt (optional, user can remove).
- FR-12: The Today view groups overdue, due today, and start-today items, sorted by urgency.
- FR-13: Editing or completing a task updates scheduled reminders immediately.

### 6.4 Reminders

- FR-14: Each task can schedule a due reminder at a user-chosen lead time.
- FR-15: If an effort estimate is set, the app also schedules a start-working reminder before the due time.
- FR-16: Reminders survive device reboot and are rescheduled after app update.
- FR-17: Onboarding explains and requests the notification permission and, on Android 12 and above, the exact alarm permission, with a graceful fallback to inexact alarms if denied.
- FR-18: A help screen explains battery optimization settings for aggressive vendors.

### 6.5 Widget

- FR-19: A home-screen widget opens the quick add sheet in one tap.

### 6.6 Account and sync

- FR-20: Sign in with email or Google.
- FR-21: Tasks are stored locally first and synced to the cloud in the background with conflict resolution by last-write-wins using update timestamps and soft deletes.
- FR-22: The user can delete their account and all cloud data from settings.

### 6.7 Limits

- FR-23: The extraction function enforces a per-user daily request limit and returns a clear message when reached. The app still allows manual entry.

## 7. Technical Approach (Proposed)

All choices below are proposals and can change during design.

**Client:** Flutter, with the feature structure from the existing flutter\_starter template (data layer with models, datasources, repositories; cubit; UI) and a single Freezed state class with a status enum.

**Local database:** Drift (SQLite). It is the source of truth for tasks.

**Notifications:** flutter\_local\_notifications with exact alarm scheduling and a boot receiver to restore schedules.

**Native Android (Kotlin):** the share target activity and the home-screen widget, connected to Flutter through a platform channel.

**OCR:** Google ML Kit text recognition, on-device, for screenshots.

**Backend:** Supabase.

- Auth for email and Google sign-in.
- Postgres for synced tasks, with Row Level Security so users read and write only their own rows.
- An Edge Function (TypeScript) as the extraction proxy: validates the session, enforces the daily limit, calls the LLM with a secret key held server-side, validates the JSON, and returns it.

**Technologies new relative to earlier projects (portfolio goals):** LLM structured extraction and prompt evaluation, Supabase with Postgres Row Level Security and Edge Functions, Drift with a custom sync layer, native Kotlin platform channel with a share target and widget, ML Kit OCR, and exact-alarm notification scheduling.

## 8. Extraction Specification

### Output schema

```json
{
  "tasks": [
    {
      "title": "string",
      "due_at": "ISO 8601 datetime or null",
      "all_day": false,
      "context": "Work | Home | Personal | custom | null",
      "notes": "string",
      "checklist": ["string"],
      "owner": "me | someone_else | unclear",
      "direction": "assigned_to_me | i_promised | waiting_on_someone | none",
      "confidence": 0.0,
      "source_excerpt": "string"
    }
  ],
  "no_task_found": false
}
```

### Rules

- Titles are short, start with a verb, and are written in the same language as the source text.
- Dates are resolved using the supplied current date, timezone, and locale. If no date is stated, due\_at is null. The model must not guess a date.
- If the text has no actionable item, return no\_task\_found as true.
- If the text says a deadline was changed or cancelled, the task is flagged so the user can update an existing item instead of creating a duplicate (manual match in v1).
- Owner and direction distinguish a request to the user, a promise by the user, and a promise by someone else. In v1 these fields are shown but tasks owned by someone else are saved with a waiting-on label.
- Confidence below 0.6 highlights the affected fields on the confirm card.

## 9. UX Overview

**Screens**

1. Onboarding: value explanation, account creation, notification permission, privacy summary.
2. Today: overdue, due today, start today.
3. All tasks: filter by context and status.
4. Confirm card (opens from share or quick add): extracted fields, edit, save, discard, add another.
5. Task detail: edit fields, checklist, source excerpt, delete.
6. Settings: contexts, reminder defaults, daily limit usage, battery help, privacy, delete account.

**Core flow:** Share from another app, then the confirm card, then Save, then the task appears in Today with its reminder scheduled.

## 10. Success Metrics

Targets are starting proposals and should be revised after the first evaluation.

- **Extraction accuracy** on an internal evaluation set of 50 to 100 labeled messages in English and Arabic: due date correct in at least 85 percent of messages with a stated date, title acceptable in at least 90 percent, and no\_task\_found correct in at least 90 percent of non-task messages.
- **Speed:** median time from share to saved task under 10 seconds on a normal connection.
- **Reliability:** scheduled reminders fire within one minute of schedule on at least 95 percent of tested devices and scenarios, including after reboot.
- **Pilot usage:** among 5 pilot users, at least 3 still using the app in week 2.

### Evaluation harness

A script runs the evaluation set through the extraction function and reports per-field accuracy. Results for each prompt or model change are recorded in the repository README to show measured improvement.

## 11. Privacy and Security

- Only text the user explicitly shares is sent for extraction. Images are converted to text on the device and the image itself is never uploaded.
- The backend does not store the shared text. It stores only the tasks the user saves. The source excerpt is optional and removable.
- The provider and plan used for the LLM should have API terms that exclude training on submitted data and offer minimal retention. Verify current terms before launch.
- Row Level Security on every table. The LLM key exists only as a server-side secret.
- The privacy notice states plainly what is sent to the AI provider and what is stored.
- Account deletion removes all cloud data.

## 12. Non-Functional Requirements

- Supports Android 8 and above in v1.
- Core screens (Today, task list, manual add) work fully offline.
- Arabic and English with full RTL support.
- Light and dark themes.
- Accessibility basics: scalable text, sufficient contrast, labels for screen readers.
- Unit tests for date handling, schema validation, sync conflict logic, and reminder scheduling.

## 13. Risks and Mitigations

- **Reminder reliability on aggressive Android vendors.** Prototype scheduling first, test on at least three vendors, and include in-app battery guidance.
- **Arabic and mixed-language extraction quality.** Build the evaluation set early and tune prompts against it before building polish.
- **LLM cost.** Per-user daily limits, short inputs, and a small, inexpensive model first.
- **Malformed model output.** Strict schema validation, one retry, manual fallback.
- **Sync complexity.** Keep v1 sync simple, with last-write-wins and soft deletes, and treat it as v1.5 if time runs short.
- **Scope creep.** Everything outside section 5 v1 stays out until the MVP is in pilot use.

## 14. Milestones (Rough)

Assumes part-time work and can be adjusted.

1. **Week 1:** Project setup from the starter template, evaluation set, extraction prompt and schema tested offline, notification scheduling prototype.
2. **Weeks 2 to 3:** Drift database, task CRUD, Today view, manual add, local reminders.
3. **Weeks 4 to 5:** Supabase auth and Row Level Security, extraction Edge Function with daily limits, confirm card, share target, OCR.
4. **Week 6:** Home-screen widget, onboarding, Arabic and RTL polish, sync.
5. **Week 7:** Pilot with 5 users, fix top issues, README with architecture and evaluation results, release build.

## 15. Open Questions

- Whether Gotit is free on the Play Store, as a domain, and as social handles.
- Which LLM provider and model to start with, balancing Arabic quality, cost, and data terms.
- Whether sync ships in v1 or v1.5.
- Monetization after the portfolio phase: free tier with daily limit and a paid tier, or bring-your-own-AI option.
- Whether to publish on the Play Store as part of v1 or keep it as a pilot build.
- iOS timing, since the share extension and notification behavior differ.
