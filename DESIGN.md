---
version: alpha
name: Gotit-design-system
description: Gotit is a calm, fast, automation-first task app. The look is warm minimalism on paper-toned neutrals, with hairline borders, restrained geometry, one confident green accent reserved for the moment of confirmation, and soft pastel tints used only to tag contexts. Identity comes from typography, spacing, and the "got it" check interaction, never from gradients, glows, or decoration. Built mobile-first for Android, with full Arabic (RTL) and English (LTR) support.

colors:
  primary: "#1F7A5C"
  accent: "#1F7A5C"
  accent-pressed: "#17634A"
  accent-soft: "#DDF0E7"
  on-accent: "#FFFFFF"
  canvas: "#FCFBF9"
  surface: "#F6F4F1"
  surface-raised: "#FFFFFF"
  hairline: "#E7E3DD"
  hairline-strong: "#CFCAC2"
  ink: "#1F1E1B"
  charcoal: "#3A3733"
  slate: "#5F5B54"
  steel: "#7D7972"
  muted: "#B5B0A8"
  warning: "#B45309"
  error: "#C92A2A"
  tint-sky: "#DDEBF7"
  tint-sky-text: "#1F4E79"
  tint-mint: "#DCF0E4"
  tint-mint-text: "#1F6B45"
  tint-lavender: "#E8E2F4"
  tint-lavender-text: "#4B3A87"
  tint-peach: "#FCE6D5"
  tint-peach-text: "#8A4B12"
  tint-rose: "#F9E0E8"
  tint-rose-text: "#8A2F52"
  tint-yellow: "#FAF0C8"
  tint-yellow-text: "#6B5A12"

typography:
  screen-title:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 28px
    fontWeight: 600
    lineHeight: 1.25
  title:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 22px
    fontWeight: 600
    lineHeight: 1.30
  heading:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 18px
    fontWeight: 600
    lineHeight: 1.40
  body:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 16px
    fontWeight: 400
    lineHeight: 1.60
  body-medium:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 16px
    fontWeight: 500
    lineHeight: 1.60
  body-sm:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.55
  caption:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.45
  caption-bold:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 13px
    fontWeight: 600
    lineHeight: 1.45
  button:
    fontFamily: IBM Plex Sans Arabic
    fontSize: 15px
    fontWeight: 500
    lineHeight: 1.30

rounded:
  xs: 4px
  sm: 6px
  md: 8px
  lg: 12px
  xl: 20px
  full: 9999px

spacing:
  xxs: 4px
  xs: 8px
  sm: 12px
  md: 16px
  lg: 20px
  xl: 24px
  xxl: 32px
  screen-gutter: 16px
  touch-target: 48px
  row-min-height: 56px

components:
  button-primary:
    backgroundColor: "{colors.accent}"
    textColor: "{colors.on-accent}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    height: 48px
    padding: "0 20px"
  button-primary-pressed:
    backgroundColor: "{colors.accent-pressed}"
  button-primary-disabled:
    textColor: "{colors.muted}"
    typography: "{typography.button}"
  button-secondary:
    textColor: "{colors.ink}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    height: 48px
    padding: "0 20px"
  button-ghost:
    textColor: "{colors.ink}"
    typography: "{typography.button}"
    rounded: "{rounded.sm}"
    height: 48px
  text-input:
    backgroundColor: "{colors.surface-raised}"
    textColor: "{colors.ink}"
    typography: "{typography.body}"
    rounded: "{rounded.md}"
    height: 48px
    padding: "0 {spacing.md}"
  text-input-error:
    textColor: "{colors.error}"
    typography: "{typography.caption}"
  task-row:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.body-medium}"
    height: 56px
    padding: "{spacing.sm} {spacing.md}"
  task-row-selected:
    backgroundColor: "{colors.accent-soft}"
    height: 56px
  task-note:
    textColor: "{colors.charcoal}"
    typography: "{typography.body}"
  task-checkbox:
    size: 24px
    rounded: "{rounded.full}"
  task-checkbox-done:
    backgroundColor: "{colors.accent}"
    textColor: "{colors.on-accent}"
    size: 24px
    rounded: "{rounded.full}"
  divider:
    backgroundColor: "{colors.hairline}"
    height: 1px
  divider-strong:
    backgroundColor: "{colors.hairline-strong}"
    height: 1px
  section-header:
    textColor: "{colors.steel}"
    typography: "{typography.caption-bold}"
    padding: "{spacing.lg} {spacing.md} {spacing.xs}"
  section-header-overdue:
    textColor: "{colors.warning}"
  context-tag:
    typography: "{typography.caption-bold}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"
  tag-work:
    backgroundColor: "{colors.tint-sky}"
    textColor: "{colors.tint-sky-text}"
    typography: "{typography.caption-bold}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"
  tag-home:
    backgroundColor: "{colors.tint-mint}"
    textColor: "{colors.tint-mint-text}"
    typography: "{typography.caption-bold}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"
  tag-personal:
    backgroundColor: "{colors.tint-lavender}"
    textColor: "{colors.tint-lavender-text}"
    typography: "{typography.caption-bold}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"
  tag-peach:
    backgroundColor: "{colors.tint-peach}"
    textColor: "{colors.tint-peach-text}"
    typography: "{typography.caption-bold}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"
  tag-rose:
    backgroundColor: "{colors.tint-rose}"
    textColor: "{colors.tint-rose-text}"
    typography: "{typography.caption-bold}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"
  tag-yellow:
    backgroundColor: "{colors.tint-yellow}"
    textColor: "{colors.tint-yellow-text}"
    typography: "{typography.caption-bold}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"
  filter-chip:
    textColor: "{colors.steel}"
    typography: "{typography.body-sm}"
    rounded: "{rounded.full}"
    height: 36px
  filter-chip-active:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.canvas}"
    typography: "{typography.body-sm}"
    rounded: "{rounded.full}"
    height: 36px
  fab:
    backgroundColor: "{colors.accent}"
    textColor: "{colors.on-accent}"
    size: 56px
    rounded: "{rounded.lg}"
  bottom-nav:
    backgroundColor: "{colors.canvas}"
    height: 64px
  bottom-sheet:
    backgroundColor: "{colors.surface-raised}"
    rounded: "{rounded.xl}"
    padding: "{spacing.xl}"
  checklist-row:
    height: 48px
    typography: "{typography.body}"
  snackbar:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.canvas}"
    typography: "{typography.body-sm}"
    rounded: "{rounded.md}"
  empty-state:
    textColor: "{colors.slate}"
    typography: "{typography.body}"
    padding: "{spacing.xxl}"
---

## Overview

Gotit should feel like a well-kept paper notebook: quiet, fast, and trustworthy. The canvas is a warm off-white, text is warm near-black, and structure comes from 1px hairlines and generous spacing instead of heavy cards or shadows. One deep green accent ({colors.accent}) carries the product's personality. It appears on the primary button, the add button, selected states, and the completion check, so green always means "confirmed" or "go."

Soft pastel tints are used only to tag contexts (Work, Home, Personal, custom). Color is never decorative.

**Key characteristics**
- Warm neutral canvas ({colors.canvas}) with hairline structure, not cold grays
- One accent color, used sparingly and consistently
- Flat surfaces; elevation only for sheets and dialogs
- 8px buttons and inputs, 12px cards, 20px top corners on bottom sheets; pills only for filter chips
- Typography does the work: weight contrast (600, 500, 400) and generous line height
- Arabic and English are equal citizens. Every component is designed for RTL first-class, not mirrored as an afterthought

## Colors

### Accent
- **Accent** ({colors.accent}): primary button, add button, selected controls, completed checkmark. White text on it passes contrast.
- **Accent Pressed** ({colors.accent-pressed}): pressed state
- **Accent Soft** ({colors.accent-soft}): selected-row or confirmation washes

### Surfaces and lines
- **Canvas** ({colors.canvas}): screen background
- **Surface** ({colors.surface}): secondary areas, input groups, section backgrounds
- **Surface Raised** ({colors.surface-raised}): sheets, dialogs, text inputs
- **Hairline** ({colors.hairline}): row dividers, card borders
- **Hairline Strong** ({colors.hairline-strong}): input borders, unchecked checkbox ring

### Text
- **Ink** ({colors.ink}): titles and task titles
- **Charcoal** ({colors.charcoal}): body emphasis
- **Slate** ({colors.slate}): secondary text, due dates
- **Steel** ({colors.steel}): section headers, inactive controls
- **Muted** ({colors.muted}): placeholders and disabled

### Semantic
- **Warning** ({colors.warning}): overdue labels and the Overdue section header. A warm amber-brown, deliberately calmer than red.
- **Error** ({colors.error}): validation errors only (for example, empty title)
- Success is the accent. Completion is the product's key moment.

### Context tints
Default mapping: Work uses sky, Home uses mint, Personal uses lavender. Custom contexts cycle through peach, rose, and yellow. Each tag pairs a tint background with its darker text color (for example {colors.tint-sky} with {colors.tint-sky-text}).

### Dark theme (values to verify with a contrast check)
| Role | Value |
|---|---|
| Canvas | #1C1B19 |
| Surface | #262522 |
| Surface Raised | #2D2C29 |
| Hairline | #3A3834 |
| Text primary | #F1EFEC |
| Text secondary | #B9B4AC |
| Accent | #4FBF98 (text on it: #10261E) |
| Warning | #F0A15B |
| Error | #F27B7B |

Dark mode keeps the same warm hue family. Never use pure black or pure white.

## Typography

**Family:** IBM Plex Sans Arabic, one family covering Arabic and Latin so mixed-language tasks look consistent. If Latin glyph quality is not right in testing, pair Noto Sans Arabic with Inter.

| Token | Size | Weight | Line height | Use |
|---|---|---|---|---|
| screen-title | 28 | 600 | 1.25 | "Today", "Tasks" |
| title | 22 | 600 | 1.30 | Task detail title, sheet titles |
| heading | 18 | 600 | 1.40 | Group titles |
| body | 16 | 400 | 1.60 | Notes, checklist items, inputs |
| body-medium | 16 | 500 | 1.60 | Task titles in rows |
| body-sm | 14 | 400 | 1.55 | Due dates, helper text |
| caption | 13 | 400 | 1.45 | Metadata |
| caption-bold | 13 | 600 | 1.45 | Section headers, tags |
| button | 15 | 500 | 1.30 | Buttons |

**Rules**
- Body line height stays at 1.6 or higher because Arabic needs the room.
- No uppercase transforms, no letter-spacing tricks (they break Arabic joining). Section headers use sentence case in semibold.
- Titles wrap to up to 3 lines before ellipsis. Never truncate at large text sizes.
- Support system text scaling up to 200%.

## Layout

- **Base unit:** 4px, with 8px as the primary step.
- **Screen gutter:** 16px on both sides.
- **Task row:** minimum height 56px, 12px vertical padding, 1px hairline divider (no card per row).
- **Touch targets:** 48 by 48dp minimum. The 24px checkbox sits inside a 48px target.
- **Vertical rhythm:** 20px above section headers, 8px between a header and its first row, 24px between form fields.
- **Safe areas:** respect system insets. The add button floats 16px above the bottom navigation.
- Use start and end (not left and right) for all horizontal padding and alignment.

## Elevation and Depth

| Level | Treatment | Use |
|---|---|---|
| 0 | Flat, hairline border | Rows, cards, inputs |
| 1 | `rgba(31,30,27,0.08) 0 4px 12px` | Add button, snackbar |
| 2 | `rgba(31,30,27,0.16) 0 16px 48px -8px` | Bottom sheets, dialogs |

No glows, no gradients, no glassmorphism.

## Shapes

| Token | Value | Use |
|---|---|---|
| xs | 4px | Small indicators |
| sm | 6px | Context tags, ghost buttons |
| md | 8px | Buttons, inputs, snackbars |
| lg | 12px | Cards, add button |
| xl | 20px | Top corners of bottom sheets |
| full | 9999px | Filter chips, checkboxes only |

## Components

**Primary button.** Accent background, white text, 48px tall, 8px radius. Used once per screen for the main action (Save). Disabled uses the hairline fill with muted text.

**Secondary and ghost buttons.** Secondary is outlined with the strong hairline. Ghost is borderless, for Cancel and low-priority actions.

**Text input.** 48px tall, white fill, strong hairline border; 2px accent border on focus; 2px error border plus an inline message below the field on error. Multiline notes grow with content.

**Task row.** Leading 24px circular checkbox (48px target), then the title in body-medium (up to 3 lines). Below it, a metadata line in body-sm slate: due date or time, checklist progress such as "2/4", and a context tag. Overdue dates turn {colors.warning}. Completing a task fills the checkbox with the accent, draws a check, strikes the title through in muted color, and collapses the row after the check animation.

**Section header.** Caption-bold in steel with a count ("Due today · 3"). The Overdue header uses the warning color.

**Context tag.** Tinted background with a darker same-hue text, 6px radius, 13px semibold.

**Filter chips.** Horizontally scrollable pill row on All Tasks: inactive has a hairline border; active uses an ink fill with canvas text.

**Add button.** 56px accent square with 12px radius and a plus icon, bottom end corner, above the bottom navigation.

**Bottom navigation.** Two destinations, Today and Tasks, with a hairline top border. Active item uses ink with an accent indicator; inactive uses steel.

**Bottom sheet.** White surface, 20px top corners, drag handle, level-2 shadow. Used for pickers (date, context) and quick actions.

**Checklist editor row.** 48px rows with a drag handle at the start, an editable text field, and a remove button at the end. An "Add item" ghost row sits at the bottom.

**Snackbar with Undo.** Appears after delete. Ink background, canvas text, Undo in accent-soft.

**Empty state.** A simple one-color line illustration in steel (no mesh, dots, or confetti), a short title, one line of guidance, and one primary action.

## Motion

- Durations 150 to 200ms, ease-out. Task completion uses a 200ms check draw, then a 200ms row collapse.
- Nothing loops, bounces, or pulses.
- Respect the system reduce-motion setting by using instant state changes.

## RTL and Localization

- All layouts use directional start and end. In Arabic, the checkbox, drag handles, and the add button flip sides, and back and forward chevrons mirror.
- Do not mirror icons that carry meaning independent of direction (check, plus, clock).
- Numbers and dates follow the app locale. Mixed Arabic and English in one task title must display correctly with bidirectional text, and the row aligns to the language of the title.
- Every screen is designed and reviewed in both languages and in light and dark.

## Accessibility

- Text contrast at least 4.5:1 and non-text contrast at least 3:1. Never use color as the only signal (overdue also has a label and icon).
- Touch targets at least 48 by 48dp.
- Every icon-only control has a screen-reader label.
- Layouts survive 200% text scale without clipping.

## Do's and Don'ts

### Do
- Use the accent only for the primary action, selection, and completion
- Use hairlines and spacing for structure instead of boxes
- Keep tag colors tied to context, not decoration
- Design the Add/Edit form as a reusable component (the later AI confirm card has the same fields)
- Show every screen's empty, loading, error, and validation states

### Don't
- No gradients, glows, or glass effects
- No pill-shaped primary buttons
- No pure black or pure white backgrounds
- No uppercase or letter-spaced text (breaks Arabic)
- No more than one primary button per screen
- No decorative illustrations beyond simple empty states

## Mobile Behavior

- Target widths: 320 to 480dp, single column. Tablet and landscape layouts are out of scope for Phase 1.
- Today and Tasks use scrolling lists with sticky section headers.
- Add/Edit opens as a full-screen form from the add button. Pickers open as bottom sheets.
- Keyboard: the primary Save button stays visible above the keyboard.

## Iteration Guide

1. Design one screen at a time, always with this file attached.
2. Reference tokens by name rather than raw hex values.
3. After edits, run `npx @google/design.md lint DESIGN.md`.
4. When Stitch output drifts (gradients, extra colors, pill buttons), repeat the Don'ts list in the prompt.
5. Map tokens to the Flutter theme (ColorScheme, TextTheme, spacing constants) before building any screen.

## Known Gaps

- Dark-theme values need a contrast check on real screens.
- Icon set is not yet chosen (default to Material Symbols, outlined, weight 400).
- Empty-state illustration style is defined in words only.
- Tablet, landscape, and iOS adaptations are deferred.
