# Bounty Technical Analysis, Patch & PR — `OphirPay/OphirPay#1357`

- **Target Issue**: [Add stream cancellation pro-rata refund verification for partial elapsed periods](https://github.com/OphirPay/OphirPay/issues/1357)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-1357](https://github.com/lienhoatienphung-svg/OphirPay/tree/fix/issue-1357)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/OphirPay/pull/7](https://github.com/lienhoatienphung-svg/OphirPay/pull/7)
- **Inspected Source File**: `contracts/ophirpay/src/contract.rs`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T01:50:04.689Z`

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

When a payment stream is cancelled via `cancel_stream` (`contracts/ophirpay/src/contract.rs`), the unvested balance is returned to the creator while vested funds remain claimable by the recipient. The current math uses linear interpolation but does not guard against zero-duration vesting intervals or rounding errors when elapsed time is an exact divisor.

## Proposed Solution

1. Audit and standardize the linear formula: `vested = (total_amount * elapsed) / duration`.
2. Add explicit zero-check on `duration` prior to division.
3. Ensure rounding always favors contract solvency (`vested + refundable == total_amount`).
4. Add fuzz test assertions across arbitrary elapsed timestamps.

## Acceptance Criteria

- [ ] Sum of claimed, vested, and refunded amounts exactly equals original stream principal
- [ ] No division by zero under any combination of timestamps
- [ ] Unit tests verify cancellation at 0%, 25%, 50%, 75%, and 100% elapsed time

## Files to Modify
- contracts/ophirpay/src/contract.rs
- contracts/ophirpay/tests/integration_tests.rs
- contracts/ophirpay/tests/proptest_payment_amounts.rs

---

**Target Branch: integr
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #1357`
- Pull Request: https://github.com/lienhoatienphung-svg/OphirPay/pull/7
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`