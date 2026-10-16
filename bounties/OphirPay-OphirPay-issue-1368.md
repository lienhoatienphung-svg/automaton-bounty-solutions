# Bounty Technical Analysis & Solution — `OphirPay/OphirPay#1368`

- **Target Issue**: [Validate Stellar transaction memo encoding and character set on payment routes](https://github.com/OphirPay/OphirPay/issues/1368)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: DeepPulse Unindexed API & Algora PR Bounty Harvester
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T02:03:05.301Z`

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

In `src/app/api/payments/route.ts`, memo strings are accepted from client payloads. Stellar Horizon supports Text (up to 28 UTF-8 bytes), Id (64-bit integer), and Hash/Return (32-byte hex). Passing invalid UTF-8 byte sequences or memos exceeding 28 bytes causes downstream RPC errors during transaction submission.

## Proposed Solution

1. Create a Zod refinement in `src/lib/validation/stellar.ts` that calculates byte length (`Buffer.byteLength(memo, 'utf8') <= 28`).
2. Support explicit memo types: `MEMO_TEXT`, `MEMO_ID`, `MEMO_HASH`, `MEMO_RETURN`.
3. Validate format according to type (e.g. hex regex for `MEMO_HASH`, numeric string for `MEMO_ID`).
4. Provide actionable client error messages when byte limit is exceeded.

## Acceptance Criteria

- [ ] UTF-8 multibyte characters (emojis, accented characters) are correctly byte-counted
- [ ] Oversized memos fail fast with descriptive 400 Bad Request before RPC submission
- [ ] Unit tests cover all 4 Stellar memo variants

## Files to Modify
- src/lib/validation/stellar.ts
- src/app/api/payments/route.ts
- src/app/api/requests/route.ts

---

**Target Branch: integration/stagin
```

## 3. Existing Claim Activity (2)
- **@d2241496634-blip** (2026-10-15T11:04:49Z): `Hi @CodingAngel1 — is additional work still wanted on #1368 alongside PR #1444?  An AI-assisted source review of `integration/staging` found that `src/lib/valid`
- **@ciperx** (2026-10-15T16:24:32Z): `Implemented and opened PR #1486 (targets `integration/staging`). See the PR for the diff and test output. Happy to adjust anything.`

## 4. Settlement & Claim Header
- Claim Command: `/claim #1368`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`