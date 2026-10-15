# Bounty Technical Analysis & Solution — `OphirPay/OphirPay#1347`

- **Target Issue**: [Add validation for token decimal precision mismatch in record_payment](https://github.com/OphirPay/OphirPay/issues/1347)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T15:43:58.049Z`

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

In `contracts/ophirpay/src/contract.rs`, when `record_payment` is invoked, the amount is checked against zero and bounds, but there is no validation verifying that the transferred amount adheres to the token's configured decimal precision. Tokens with non-standard decimals (e.g. USDC with 7 decimals vs custom tokens with 0 to 18 decimals) can result in truncation or precision loss during fee calculations.

## Proposed Solution

1. Add a token decimals inquiry or configuration lookup within `record_payment`.
2. Validate that `amount` complies with the minimum divisible unit for the token asset.
3. Emit a descriptive error `PaymentError::InvalidDecimalPrecision` if precision exceeds allowable units.
4. Add unit test coverage in `contracts/ophirpay/tests/integration_tests.rs`.

## Acceptance Criteria

- [ ] Amounts violating token decimal constraints are rejected with `PaymentError::InvalidDecimalPrecision`
- [ ] Valid decimal payments succeed across 7-decimal (XLM/USDC) and custom asset configurations
- [ ] Unit tests cover edge-case fractional amounts

## Files to Modify
- contracts/ophirpay/src/contract.rs
- contracts/oph
```

## 3. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 4. Settlement & Claim Header
- Claim Command: `/claim #1347`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`