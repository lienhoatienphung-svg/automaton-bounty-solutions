# Bounty Technical Analysis, Patch & PR — `willi-d7/williams-contracts#109`

- **Target Issue**: [Keeper Bounty Token Selection Arbitrarily Favors First Token in Multi-Token Estates](https://github.com/willi-d7/williams-contracts/issues/109)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-109](https://github.com/lienhoatienphung-svg/williams-contracts/tree/fix/issue-109)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/williams-contracts/pull/1](https://github.com/lienhoatienphung-svg/williams-contracts/pull/1)
- **Inspected Source File**: `contracts/will/src/lib.rs`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T00:04:39.360Z`

## 1. Repository Root Structure (`willi-d7/williams-contracts`)
- `.github`
- `.gitignore`
- `CHANGELOG.md`
- `CONTRIBUTING.md`
- `Cargo.lock`
- `Cargo.toml`
- `LICENSE`
- `README.md`
- `SECURITY.md`
- `audit.toml`
- `contracts`
- `deployments`
- `docs`
- `drips wave backlog.md`
- `fuzz`
- `justfile`
- `scripts`
- `spec`

## 2. Inspected Source File (`contracts/will/src/lib.rs`)
```
// The deployed contract is `no_std`. The test and fuzzing harnesses need
// `std` (the Soroban test host, `proptest` and `libfuzzer-sys` all pull it
// in), so `std` is linked only for those configurations. The wasm build,
// which sees neither `cfg(test)` nor the `fuzzing` feature, stays `no_std`.
#![cfg_attr(not(any(test, feature = "fuzzing")), no_std)]
// `create_will` legitimately needs more than clippy's default 7-argument
// threshold (token/beneficiary/period/guardian/bounty/confirmation config
// all belong at creation time). `#[contractimpl]`'s generated dispatch code
// inherits that arg count on a synthetic item the attribute doesn't reach
// when placed on the source function or the impl block, so it's set crate-wide.
#![allow(clippy::too_many_arguments)]

//! Williams — a trustless on-chain inheritance and dead man's switch protocol
//! for Stellar Soroban.
//!
//! An owner locks one or more tokens (e.g. USDC, XLM, any SEP-41 asset) into
//! a `Will`, names beneficiaries with percentage shares, and periodically
//! calls [`WillContract::check_in`] to prove they are still active. If the
//! owner misses a check-in deadline, anyone may call
//! [`WillContract::trigger_w
```

## 3. Issue Specification Excerpt
```markdown
### Problem

In `distribute()`, `bounty_token` is determined by inspecting the first token in `will.balances` that holds a balance. If an estate holds 1 XLM ($0.10) and 100,000 USDC ($100,000), a 100 bps (1%) keeper bounty pays out 1% of 1 XLM ($0.001) rather than a share of the high-value asset, disincentivizing keepers.

### Relevant Implementation Context

In `contracts/will/src/lib.rs` (lines 5470–5495).

### Impact and Threat Model

Inadequate keeper incentives on multi-token estates risk abandoned wills where keepers refuse to pay gas to trigger releases.

### Proposed Implementation Direction

Allow the owner to specify the bounty token, or deduct keeper bounty proportionally across all held tokens.

### Acceptance Criteria

- [ ] Keeper bounty can be paid across all tokens or targeted to high-value assets
- [ ] Keeper incentive economics are aligned with gas costs
- [ ] Unit test verifies proportional bounty distribution

### Testing Requirements

Unit test checking bounty payout on a will with small native balance and large secondary balance.

### Relevant Files

`contracts/will/src/lib.rs` (`distribute`)

### Dependencies

None identified.

---

---

```

## 4. Existing Claim Activity (1)
- **@LioraHg** (2026-10-15T23:37:26Z): `Fix is up: https://github.com/willi-d7/williams-contracts/pull/130  Summary:  - `distribute()` now builds an explicit bounty plan before touching balances. Defa`

## 5. Settlement & Claim Header
- Claim Command: `/claim #109`
- Pull Request: https://github.com/lienhoatienphung-svg/williams-contracts/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`