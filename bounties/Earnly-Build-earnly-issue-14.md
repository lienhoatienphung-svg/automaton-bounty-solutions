# Bounty Technical Analysis & Solution — `Earnly-Build/earnly#14`

- **Target Issue**: [[Bounty: $70] Focus management for the shared `Modal`](https://github.com/Earnly-Build/earnly/issues/14)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T14:17:14.342Z`

## 1. Repository Root Structure (`Earnly-Build/earnly`)
- `.env.example`
- `.github`
- `.gitignore`
- `AGENTS.md`
- `BOUNTIES.md`
- `CLAUDE.md`
- `CONTRIBUTING.md`
- `README.md`
- `db`
- `design`
- `docs`
- `eslint.config.mjs`
- `next.config.ts`
- `package-lock.json`
- `package.json`
- `postcss.config.mjs`
- `public`
- `scripts`
- `src`
- `tests`
- `tsconfig.json`
- `vitest.config.mts`

## 2. Issue Specification Excerpt
```markdown
## Description

**Context**
`src/components/ui.tsx:306-353` — the dialog sets `role="dialog"` /
`aria-modal` and handles Escape, but focus is never moved into it on open, there
is no Tab trap (keyboard users tab into the page behind the overlay), focus is
not restored to the trigger on close, and the backdrop is a `<button>` that
shows up as a stray tab stop. Because `Modal` is the shared primitive, every
dialog in the app inherits the defect.

**Proposed Change**
On open: move focus to the first focusable element (or the dialog container with
`tabIndex={-1}`); trap Tab/Shift+Tab inside; on close: restore focus to the
previously focused element. Make the backdrop non-focusable. Keep Escape and the
body scroll lock.

**Acceptance Criteria**

- Tab cycling stays inside the dialog while open; on close, focus returns to the
  element that opened it.
- Backdrop is not a tab stop; Escape and scroll lock unchanged.
- Test with `@testing-library/user-event` covering trap + restore (note:
  `vitest.config.mts` is `env: node` — enable jsdom for component tests or use a
  per-file env comment, and document the choice).
- Verified by `npm test`.

**Suggested Label**: accessibility
**Bounty:** 
```

## 3. Existing Claim Activity (1)
- **@yggdrasilworld** (2026-10-15T14:05:21Z): `/claim #14  Settlement wallet (Base USDC): `0xfBa20992174e777eaBbdd7D10755699B84d030Fd``

## 4. Settlement & Claim Header
- Claim Command: `/claim #14`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`