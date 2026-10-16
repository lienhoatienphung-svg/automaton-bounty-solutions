# Bounty Technical Analysis, Patch & PR — `OphirPay/OphirPay#1375`

- **Target Issue**: [Add QR code payment request generator with configurable amounts and assets](https://github.com/OphirPay/OphirPay/issues/1375)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Fork Fix Branch**: [fix/issue-1375](https://github.com/lienhoatienphung-svg/OphirPay/tree/fix/issue-1375)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/OphirPay/pull/5](https://github.com/lienhoatienphung-svg/OphirPay/pull/5)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T01:45:30.368Z`

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

The payment request view supports link sharing, but in-person merchants and mobile users require scanning SEP-0007 / Stellar pay QR codes directly from the screen. The existing `QrCode.tsx` component is only used for two-factor authentication setup and lacks payment URI formatting.

## Proposed Solution

1. Enhance `src/components/ui/QrCode.tsx` to generate SEP-0007 compliant `web+stellar:pay` URIs.
2. Add amount, asset code, issuer, and memo query parameters to the QR code generator.
3. Include a "Download QR Image" and "Copy URI" button.
4. Integrate into the payment request modal in `src/components/payments/PaymentRequestModal.tsx`.

## Acceptance Criteria

- [ ] QR code generates valid SEP-7 pay URI that mobile wallets (Lobstr, Vibrant) can parse
- [ ] Users can download high-resolution PNG of the QR code
- [ ] UI provides quick-copy feedback for the payment link

## Files to Modify
- src/components/ui/QrCode.tsx
- src/components/payments/PaymentRequestModal.tsx
- src/lib/stellar-uri.ts

---

**Target Branch: integration/staging**
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #1375`
- Pull Request: https://github.com/lienhoatienphung-svg/OphirPay/pull/5
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`