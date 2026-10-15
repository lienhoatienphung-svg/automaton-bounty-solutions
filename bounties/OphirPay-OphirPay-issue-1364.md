# Bounty Technical Analysis & Solution — `OphirPay/OphirPay#1364`

- **Target Issue**: [Add RFC 7807 problem details error formatting across all /api/payments routes](https://github.com/OphirPay/OphirPay/issues/1364)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T16:56:49.473Z`

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

API error responses across `src/app/api/payments/` return varying JSON structures (e.g. `{ error: "msg" }`, `{ message: "..." }`, or `{ code, details }`). Standardizing on the RFC 7807 (Problem Details for HTTP APIs) format ensures consistent client SDK error parsing and easier third-party developer integrations.

## Proposed Solution

1. Create a helper `formatProblemDetails({ type, title, status, detail, instance })` in `src/lib/api-errors.ts`.
2. Update payment mutation routes (`POST /api/payments`, `POST /api/payments/cancel`, `POST /api/payments/retry`) to return `application/problem+json`.
3. Include standard validation field error mappings for Zod schema rejections.
4. Update TypeScript error schemas in `packages/ophirpay-client`.

## Acceptance Criteria

- [ ] All error responses match RFC 7807 specification
- [ ] Content-Type header returns `application/problem+json`
- [ ] Client SDK parses problem details without throwing generic error

## Files to Modify
- src/lib/api-errors.ts
- src/app/api/payments/route.ts
- src/app/api/payments/cancel/route.ts
- src/app/api/payments/retry/route.ts

---

**Target Branch: int
```

## 3. Existing Claim Activity (2)
- **@valmir5522** (2026-10-15T01:05:04Z): `/attempt #1364  Implementing RFC 7807 problem details across all /api/payments routes.  Plan: - create helper formatProblemDetails in src/lib/api-errors.ts with`
- **@ciperx** (2026-10-15T16:24:33Z): `Implemented and opened PR #1491 (targets `integration/staging`). See the PR for the diff and test output. Happy to adjust anything.`

## 4. Settlement & Claim Header
- Claim Command: `/claim #1364`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`