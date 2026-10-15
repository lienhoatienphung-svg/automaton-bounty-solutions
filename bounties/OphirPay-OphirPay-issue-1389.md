# Bounty Technical Analysis, Patch & PR — `OphirPay/OphirPay#1389`

- **Target Issue**: [Add session re-authentication check on critical administrative actions](https://github.com/OphirPay/OphirPay/issues/1389)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-1389](https://github.com/lienhoatienphung-svg/OphirPay/tree/fix/issue-1389)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/OphirPay/pull/2](https://github.com/lienhoatienphung-svg/OphirPay/pull/2)
- **Inspected Source File**: `src/app/api/fee-config/route.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T21:10:02.843Z`

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

## 2. Inspected Source File (`src/app/api/fee-config/route.ts`)
```
// SPDX-License-Identifier: MIT
import { withMetrics } from "@/lib/metrics-middleware";

import { successResponse, handleApiError, unauthorizedError } from "@/lib/api-response";
import { getAuthContext } from "@/lib/auth-session";
import { simulateContractCall, DEFAULT_CONTRACT_ID, CHAIN_READ_SOURCE } from "@/lib/contracts";
import { withRequestLogging } from "@/lib/request-logging";
import { cachedRead, readCacheKey, READ_TTL_MS } from "@/lib/api-cache";
import { readCacheHeaders } from "@/lib/cache";

/**
 * GET /api/fee-config — current fee configuration from the Soroban contract.
 * Simulates a read-only call to OphirPayContract.get_fee_config().
 *
 * Cached for a few seconds (#741). A fee config change invalidates the key
 * immediately via `invalidateCache("fee-config")` — see docs/PERFORMANCE.md
 * for the invalidation matrix.
 */
export const GET = withMetrics("GET /api/fee-config", withRequestLogging(async function GET(request: Request) {
  try {
    const auth = await getAuthContext(request);
    if (!auth) {
      return unauthorizedError("Authentication required. Connect your wallet or provide an API key.");
    }

    const { value: result, status } = await cachedRead
```

## 3. Issue Specification Excerpt
```markdown
**Target Branch: integration/staging**

---

## Description

Sensitive actions such as updating fee configuration (`src/app/api/fee-config/route.ts`), rotating organization master keys, or modifying RBAC role assignments rely solely on existing session cookies. If a user's browser is temporarily unattended, an attacker could perform high-impact admin mutations without wallet signature re-verification.

## Proposed Solution

1. Implement a "sudo mode" challenge middleware in `src/lib/session-sudo.ts`.
2. Require a fresh wallet challenge signature if the active session's last cryptographic verification was older than 15 minutes.
3. Return HTTP 403 `SUDO_REQUIRED` with a challenge payload when re-authentication is required.
4. Add frontend modal prompting quick Freighter re-signing before continuing.

## Acceptance Criteria

- [ ] Critical admin operations require cryptographic wallet signature if session verification is older than 15m
- [ ] Non-critical read and standard operations proceed without interruption
- [ ] E2E security test in `e2e/admin-rbac.spec.ts` verifies re-auth enforcement

## Files to Modify
- src/lib/session-sudo.ts
- src/app/api/fee-config/route.ts
- src/app/api/r
```

## 4. Existing Claim Activity (2)
- **@Madatest** (2026-10-15T14:10:51Z): `### 🛠️ Proposed Solution & PR Proposal: Admin Sudo Re-authentication Challenge  Hello @maintainers,  I have resolved issue #1389 targeting branch `integration/`
- **@sparkysolutions10-pixel** (2026-10-15T19:05:54Z): `/claim #1389  ### 🤖 MiroFish Autonomous Bug Resolution & Proof of Fix  - **Official Pull Request:** [https://github.com/OphirPay/OphirPay/pull/1514](https://gi`

## 5. Settlement & Claim Header
- Claim Command: `/claim #1389`
- Pull Request: https://github.com/lienhoatienphung-svg/OphirPay/pull/2
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`