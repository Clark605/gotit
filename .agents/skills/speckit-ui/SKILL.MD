---
name: speckit-ui
description: Adds a UI design stage to a Spec Kit feature, between the plan and the tasks. Use whenever the user says "speckit ui", "ui brief", "design the UI for this feature", "create the design folder", "generate the Stitch screens", "finalize the design", or "update the plan with the design", or when a feature has a spec.md and plan.md but no approved screens yet. Mode "brief" reads the spec, plan, and DESIGN.md, creates specs/<feature>/design/ with a UI brief and per-screen Stitch prompts, and optionally generates screens through the Stitch MCP. Mode "finalize" runs after the human approves the screens: it checks them against the spec and DESIGN.md, then updates spec.md references and plan.md and prepares guidance for /speckit.tasks. Never write app code in this skill.
---

# Spec Kit UI Stage

Spec Kit has no design step, so this skill adds one. It turns the behavior described in a spec into approved screens, and feeds those screens back into the plan and tasks so implementation matches the design.

## Where it fits

```
/speckit.specify -> /speckit.clarify -> /speckit.plan
   -> speckit-ui brief        (this skill)
   -> HUMAN: generate or review Stitch screens, approve them
   -> speckit-ui finalize     (this skill)
   -> /speckit.tasks -> /speckit.analyze -> /speckit.implement
```

The stage has two modes because a human must approve the screens in between. Never run both modes in one go.

## Ground rules

- **Do not write Flutter or any app code.** This stage produces documents and design assets only.
- **Do not choose visual style.** `DESIGN.md` (repo root) and Stitch decide colors, fonts, spacing, and shapes. The brief describes content, behavior, and states.
- **Never overwrite `DESIGN.md`.** If the Stitch project suggests changes, write them to `design-notes.md` as proposals.
- **Never delete or overwrite existing Stitch screens or approved files.** Add new versions with a suffix.
- **Trace everything.** Every screen and component references the FR, SC, or user story numbers it satisfies.
- **Ask when unsure.** Product questions the spec does not answer go into an "Open questions" list, not into guesses.
- **Follow `AGENTS.md` and `.specify/memory/constitution.md`.** If this skill conflicts with the constitution, the constitution wins.

## Step 0: Locate inputs (both modes)

1. Find the current feature directory: use `SPECIFY_FEATURE` if set, else derive from the git branch, else ask. Spec Kit stores it at `specs/<feature>/`.
2. Required: `specs/<feature>/spec.md`, repo-root `DESIGN.md`, and `.specify/memory/constitution.md`. If `DESIGN.md` is missing, stop and tell the user.
3. Expected: `plan.md` and, if present, `data-model.md`. If `plan.md` is missing, continue in brief mode using the spec alone and say so in the brief.
4. Print a one-line summary of what was found before doing anything.

## Mode: brief

Trigger: "speckit ui brief" or the user asks to start the UI stage.

### 1. Create the folder

```
specs/<feature>/design/
  ui-brief.md        content and behavior of each screen
  stitch-prompts.md  one ready-to-paste prompt per screen
  screens/           approved screenshots (added by the human or Stitch MCP)
  design-notes.md    decisions, deviations, open questions
```

Use `screens/` file names like `01-today-default-en-light.png`, `01-today-default-ar-dark.png`.

### 2. Write `ui-brief.md`

This is a brief for the designer, not a visual design. Use this structure:

```
# UI Brief: <feature>
Sources: spec.md, plan.md, DESIGN.md (list versions or dates)

## Screen inventory
| # | Screen | Purpose | Spec refs | Cubit/state (from plan) |

## Shared components
(components used by more than one screen, with the screens that use them)

## Screen: <name>   (repeat per screen)
- Purpose, entry points, and exits
- Content shown (entity fields from data-model/plan)
- Actions available
- States: normal, loading, empty, error, validation, offline
- Edge cases from the spec that affect this screen
- Localization notes: Arabic RTL, mixed-language text, date and number formats
- Acceptance scenarios covered (copy the IDs)

## Open questions
(product decisions the spec does not settle)
```

Include every screen the spec implies, including empty states, pickers, bottom sheets, and confirmation or undo feedback. Do not include screens from other phases.

### 3. Write `stitch-prompts.md`

- Start with a shared preface: summarize the product in two sentences, the key rules from `DESIGN.md` (accent usage, no gradients or glows, touch targets, one primary button per screen), and the requirement to design Arabic RTL and English LTR, light and dark.
- Then one prompt per screen: purpose, what it must show, actions, states to produce as separate frames, realistic sample content in English and Arabic.
- End with a review checklist: matches acceptance scenarios, accent used only as allowed, no forbidden effects, 48dp targets, survives 200% text, dark mode keeps the same character.
- Tell the user to attach `DESIGN.md` to every Stitch prompt.

### 4. Stitch MCP (only if connected)

1. List the MCP's available tools. Do not assume tool names.
2. If it exposes project and screen generation tools, ask the user for confirmation, create a Stitch project named `<app>-<feature>`, and generate screens one at a time from `stitch-prompts.md`, in the brief's order. Save references (screen IDs and links) in `design-notes.md`.
3. If it only exposes read tools, or generation fails, do not retry in a loop. Tell the user to run the prompts manually in Stitch.

### 5. Stop and hand off

Print this and end the turn:

```
UI brief ready in specs/<feature>/design/.
Your turn:
1. Review ui-brief.md and answer its open questions.
2. Generate or review the screens in Stitch (attach DESIGN.md each time).
3. Approve each screen against the checklist.
4. Export approved screenshots into design/screens/.
5. Tell me "speckit-ui finalize".
```

## Mode: finalize

Trigger: "speckit ui finalize" after the human approved the screens.

### 1. Verify assets

Confirm `design/screens/` contains approved screenshots. If a Stitch MCP is connected and files are missing, fetch the approved screens by the IDs recorded in `design-notes.md`. If any screen in the inventory has no approved image, list it and stop.

### 2. Reconcile

For every screen, check:

- **Spec coverage:** every FR, SC, and acceptance scenario mapped to at least one screen or state. List gaps.
- **DESIGN.md compliance:** accent usage, radius, spacing, touch targets, forbidden effects, RTL handling.
- **Behavior conflicts:** anything in a screen that implies behavior the spec does not allow.

Write the findings to `design-notes.md` as a table: item, finding, recommendation. Do not silently fix designs. If a finding changes behavior or scope, ask the user before continuing.

### 3. Update `spec.md` (append only)

Add a "Design references" section at the end: a table of screen, file path, and the FR/SC numbers covered. Do not modify requirements, scenarios, or success criteria. If the design reveals a requirement gap, record it in `design-notes.md` and suggest the user run `/speckit.clarify` or amend the spec.

### 4. Update `plan.md`

Add or replace a "UI Design" section containing:

- Screen-to-widget breakdown: each screen, its widgets, the cubit and state class that drive it (using the template's `data/`, `cubit/`, `ui/` structure).
- Shared widgets to build once, and where they live.
- Theme rule: only theme tokens, with no hardcoded colors, sizes, or text styles.
- Test plan: golden tests per screen and state in light, dark, Arabic RTL, and large text, plus widget tests for the spec's acceptance scenarios. State that golden baselines are accepted only after the human compares them with the approved screenshots.
- Design deviations: anything the implementation will intentionally differ on, with the reason.
- Constitution check: confirm the UI rules from the constitution are satisfied or list exceptions.

Do not change the data model or architecture unless a screen requires it, and flag any such change clearly in the summary.

### 5. Prepare tasks guidance

Do not generate `tasks.md` unless the user asks. Print a block to paste into `/speckit.tasks`:

```
Task shape for UI work:
1. Theme check task first: confirm tokens needed by these screens exist.
2. One task per shared widget, with golden tests.
3. One task per screen: build UI from design/screens/<file>, wire to its cubit,
   add golden tests (light, dark, RTL, large text), and compare with the approved
   screenshot before accepting baselines.
4. Final task: run flutter analyze, all tests, and review SC-005 (RTL and clipping).
```

If `tasks.md` already exists, compare it with this shape and list the missing UI tasks as a proposed diff. Do not regenerate it silently.

### 6. Final report

Summarize files created or changed, gaps and deviations, open questions, and the next command (`/speckit.tasks`).

## Failure handling

- Missing inputs: say exactly what is missing and stop.
- Spec or plan contradicts `DESIGN.md`: record it in `design-notes.md` and ask the user which wins.
- Never continue to finalize without approved screens.