# Bounty Technical Analysis & Solution — `OphirPay/OphirPay#1350`

- **Target Issue**: [Enforce minimum and maximum duration bounds on payment streams in create_stream](https://github.com/OphirPay/OphirPay/issues/1350)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T11:44:45.261Z`

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

## 2. Issue Specification Excerpt
```markdown
**Target Branch: integration/staging**

---

## Description

In `contracts/ophirpay/src/contract.rs`, `create_stream` accepts arbitrary `start_time` and `end_time` timestamps as long as `end_time > start_time`. This permits pathological streams with durations of 1 second (which could cause division edge cases in vesting math) or unreasonably far in the future (exceeding maximum ledger TTL guarantees).

## Proposed Solution

1. Define `MIN_STREAM_DURATION` (e.g. 60 seconds) and `MAX_STREAM_DURATION` (e.g. 5 years in seconds) constants.
2. In `create_stream`, validate `end_time - start_time` against both bounds.
3. Return `PaymentError::StreamDurationTooShort` or `PaymentError::StreamDurationTooLong`.
4. Add unit test assertions for both boundary conditions.

## Acceptance Criteria

- [ ] Streams shorter than `MIN_STREAM_DURATION` fail with `PaymentError::StreamDurationTooShort`
- [ ] Streams exceeding `MAX_STREAM_DURATION` fail with `PaymentError::StreamDurationTooLong`
- [ ] Valid duration streams continue to initialize normally

## Files to Modify
- contracts/ophirpay/src/contract.rs
- contracts/ophirpay/src/errors.rs
- contracts/ophirpay/tests/integration_tests.rs

---

**Target 
```

## 3. Existing Claim Activity (1)
- **@lienhoatienphung-svg** (2026-10-15T11:40:38Z): `Hi @CodingAngel1 — I'd like to claim and be assigned to `#1350` (**Enforce minimum and maximum duration bounds on payment streams in `create_stream`**).  Follow`

## 4. Settlement & Claim Header
- Claim Command: `/claim #1350`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`