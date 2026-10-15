# Bounty Technical Analysis, Patch & PR — `OphirPay/OphirPay#1353`

- **Target Issue**: [Validate dispute timeout window in resolve_dispute to prevent premature resolution](https://github.com/OphirPay/OphirPay/issues/1353)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-1353](https://github.com/lienhoatienphung-svg/OphirPay/tree/fix/issue-1353)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/OphirPay/pull/1](https://github.com/lienhoatienphung-svg/OphirPay/pull/1)
- **Inspected Source File**: `contracts/ophirpay/src/contract.rs`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T18:36:39.061Z`

## 1. Repository Root Structure (`OphirPay/OphirPay`)
- `.commitlintrc.json`
- `.devcontainer`
- `.dockerignore`
- `.editorconfig`
- `.env.example`
- `.gitattributes`
- `.github`
- `.gitignore`
- `.gitleaks.toml`
- `.nvmrc`
- `.prettierrc`
- `.trivyignore`
- `.typos.toml`
- `.well-known`
- `CHANGELOG.md`
- `CITATION.cff`
- `CODE_OF_CONDUCT.md`
- `CONTRIBUTING.md`
- `Dockerfile`
- `GLOSSARY.md`
- `GOVERNANCE.md`
- `LICENSE`
- `MAINTAINERS.md`
- `README.es.md`
- `README.fr.md`
- `README.ja.md`
- `README.md`
- `RELEASE.md`
- `ROADMAP.md`
- `SECURITY.md`
- `bundle-budget.json`
- `contracts`
- `docker-compose.yml`
- `docs`
- `e2e`
- `eslint.config.mjs`
- `examples`
- `helm`
- `k8s`
- `lighthouserc.json`
- `monitoring`
- `next.config.ts`
- `package-lock.json`
- `package.json`
- `packages`
- `playwright.config.ts`
- `playwright.visual.config.ts`
- `postcss.config.mjs`
- `prisma`
- `public`
- `scripts`
- `src`
- `tailwind.config.ts`
- `tests`
- `tsconfig.json`
- `vercel.json`
- `vitest.config.ts`
- `vitest.setup.ts`

## 2. Inspected Source File (`contracts/ophirpay/src/contract.rs`)
```
#![allow(unused_imports)]
#![allow(dead_code)]
use soroban_sdk::{
    contract, contracterror, contractimpl, contracttype, symbol_short, token, Address, Env, String,
    Symbol, Vec,
};
use crate::storage::*;
use crate::types::*;
use crate::errors::*;
use crate::events::*;
use crate::helpers::*;
use crate::spending_limit::is_spending_limit_expired;
// ── Contract Version ───────────────────────────────────────────
pub const CONTRACT_VERSION: u32 = 2;

// ── Storage-Bump Policy Constants ──────────────────────────────
// Soroban persistent storage entries have a TTL measured in ledgers.
// Without periodic bumps, entries expire and data is lost permanently.
//
// Policy:
//   • `BUMP_MIN_TTL` (5 000 ledgers ≈ 3.5 days): minimum TTL applied
//     on every write.  If residual TTL is already ≥ 5 000 the call is a
//     no-op (Soroban clamps to current_ttl + min/max).
//   • `BUMP_MAX_TTL` (50 000 ledgers ≈ 35 days): the ceiling that entries
//     are bumped to on every write or maintenance call.
//   • `BUMP_MAINTENANCE_TTL` (100 000 ledgers ≈ 70 days): the ceiling
//     used by the `bump_storage` maintenance function.  Higher than
//     on-write bumps to reduce
```

## 3. Issue Specification Excerpt
```markdown
**Target Branch: integration/staging**

---

## Description

In `contracts/ophirpay/src/contract.rs`, escrow disputes can be raised by either buyer or seller. However, `resolve_dispute` allows the arbitrator to execute immediate resolution even if an active dispute grace period has not elapsed, precluding both parties from providing supporting evidence or reaching mutual cancellation.

## Proposed Solution

1. Introduce `dispute_initiated_at` timestamp field on `EscrowRecord`.
2. Add a configurable `MIN_DISPUTE_PERIOD` (e.g. 24 hours) during which resolution cannot be unilaterally finalized unless both parties sign off.
3. Return `PaymentError::DisputeCoolingOffActive` if resolution is attempted prematurely.
4. Add unit test coverage for the dispute timeline.

## Acceptance Criteria

- [ ] Dispute resolution fails if invoked prior to the cooling-off window elapsing
- [ ] Mutual agreement bypasses the dispute timeout
- [ ] Unit tests verify timeline enforcement and state transitions

## Files to Modify
- contracts/ophirpay/src/types.rs
- contracts/ophirpay/src/contract.rs
- contracts/ophirpay/src/errors.rs
- contracts/ophirpay/tests/integration_tests.rs

---

**Target Branch: integr
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #1353`
- Pull Request: https://github.com/lienhoatienphung-svg/OphirPay/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`