# Bounty Technical Analysis & Solution — `Earnly-Build/earnly#4`

- **Target Issue**: [[Bounty: $100] Don't mark Stellar transactions failed on a transient Horizon 404](https://github.com/Earnly-Build/earnly/issues/4)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T13:33:59.546Z`

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
`src/lib/chain/stellar.ts:771-778` — `reconcileStellarTransaction` treats any
"not found" error from Horizon as proof the transaction was never included and
writes `status: "failed"`. Horizon routinely returns 404 for a transaction that
has been submitted but not yet ingested (and during failover), so a payment that
is actually settling can be permanently marked failed. This runs from the
dashboard loop in `src/app/api/wallet/stellar/route.ts:30-35` on every load, so
the bad transition fires within seconds of a send.

**Proposed Change**
Make 404 terminal only after a grace period — e.g. keep `pending` for the first
N reconciliations or until the row is older than X minutes since creation, then
fall to `failed`. Distinguish "tx not found" from "tx too old", and persist the
attempt count / last-checked timestamp needed to make that decision.

**Acceptance Criteria**

- A 404 right after creation leaves the transaction `pending`; a 404 after the
  grace window transitions it to `failed`.
- A found transaction with `successful: false` still goes straight to `failed`.
- The grace parameters are constants or config, not magic numbers inline in the
  reconcile
```

## 3. Existing Claim Activity (1)
- **@lienhoatienphung-svg** (2026-10-15T13:30:19Z): `/claim #4  Settlement wallet (Base USDC): `0x3806cd592a508d1992Ed007C2F53de251C2E7452``

## 4. Settlement & Claim Header
- Claim Command: `/claim #4`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`