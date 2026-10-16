# Bounty Technical Analysis, Patch & PR — `OphirPay/OphirPay#1378`

- **Target Issue**: [Add drag-and-drop CSV batch upload zone with visual upload progress feedback](https://github.com/OphirPay/OphirPay/issues/1378)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Fork Fix Branch**: [fix/issue-1378](https://github.com/lienhoatienphung-svg/OphirPay/tree/fix/issue-1378)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/OphirPay/pull/6](https://github.com/lienhoatienphung-svg/OphirPay/pull/6)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T00:57:33.965Z`

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


## 3. Issue Specification Excerpt
```markdown
**Target Branch: integration/staging**

---

## Description

In `src/components/CsvBatchImport.tsx`, batch CSV files can currently only be selected via standard file dialog input. Users importing payroll or vendor lists expect modern drag-and-drop file upload with visual dropping feedback, file format validation before parsing, and progress bar for parsing large files.

## Proposed Solution

1. Implement HTML5 drag-and-drop event handlers (`onDragOver`, `onDragLeave`, `onDrop`) in `CsvBatchImport.tsx`.
2. Add visual states: idle, active drag-over, parsing, and error.
3. Validate MIME type (`text/csv`, `application/vnd.ms-excel`) and file extension before ingestion.
4. Render file metadata (name, size in KB, row count) before launching verification.

## Acceptance Criteria

- [ ] Users can drag and drop CSV files into the upload zone with clear visual highlights
- [ ] Non-CSV files are rejected immediately with user-friendly error toast
- [ ] File size and row count display immediately upon drop

## Files to Modify
- src/components/CsvBatchImport.tsx
- src/components/ui/ProgressBar.tsx
- src/components/batch/BatchDropzone.tsx

---

**Target Branch: integration/staging**
```

## 4. Existing Claim Activity (3)
- **@xiaofeng0920-Happy** (2026-10-15T11:14:53Z): `Hi! I’m interested in an AI-assisted paid contribution.  I checked `integration/staging`: drag/drop handlers and highlighting already exist. I also see submissi`
- **@abhaykushwaha1009-png** (2026-10-15T13:36:40Z): `Is there still a funded, unassigned milestone for #1378 after the review of PRs #1380 and #1381?  I checked integration/staging: drag-and-drop handlers and high`
- **@wanguanglu** (2026-10-16T00:38:51Z): `Hi @CodingAngel1, I’m Guanglu Wan from Zhixing Studio (知行造物). Is there any remaining paid, unassigned scope for #1378 after reviewing the existing PRs, includin`

## 5. Settlement & Claim Header
- Claim Command: `/claim #1378`
- Pull Request: https://github.com/lienhoatienphung-svg/OphirPay/pull/6
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`