# Bounty Technical Analysis & Solution — `Earnly-Build/earnly#27`

- **Target Issue**: [[Bounty: $60] Version the localStorage payload in `store.tsx`](https://github.com/Earnly-Build/earnly/issues/27)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T13:51:10.716Z`

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
`src/lib/store.tsx:175-197` reads one `localStorage` key, `JSON.parse`s it, and
spreads it over `initial` state with no schema version. Every future shape
change to the persisted slice silently mixes old data into new state: renamed
fields keep their old values via the spread, removed fields linger, and a
corrupt or hand-edited payload throws inside the parse with no recovery path
(the catch leaves the user stuck before `ready` flips, or crashes the provider).
Demo users on long-lived browsers will be the QA for every migration you ship.

**Proposed Change**
Wrap the persisted payload in `{ v: <number>, data: {...} }`. On load: missing
or unparsable payload → fall back to `initial` (never throw); older version →
run an explicit migration chain or discard; newer version → discard rather than
half-apply. Keep demo behavior identical for fresh users.

**Acceptance Criteria**

- Payload carries a version field; the loader survives corrupt JSON (falls back
  to defaults, sets `ready`).
- A documented migration example exists (at least one version bump path tested).
- Round-trip test: save → reload → identical state; corrupt-payload test →
  defaults, no throw
```

## 3. Existing Claim Activity (1)
- **@Hugohong258** (2026-10-15T13:31:57Z): `Hi, I'm checking the payment terms for #27 before claiming or starting work. The new README and CONTRIBUTING say that the title amount is paid in Base USDC on m`

## 4. Settlement & Claim Header
- Claim Command: `/claim #27`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`