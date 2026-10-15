# Bounty Technical Analysis, Patch & PR — `OphirPay/OphirPay#1386`

- **Target Issue**: [Implement timing-safe HMAC signature verification in webhook handler](https://github.com/OphirPay/OphirPay/issues/1386)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-1386](https://github.com/lienhoatienphung-svg/OphirPay/tree/fix/issue-1386)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/OphirPay/pull/4](https://github.com/lienhoatienphung-svg/OphirPay/pull/4)
- **Inspected Source File**: `src/lib/webhook-deliver.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T21:16:21.707Z`

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

## 2. Inspected Source File (`src/lib/webhook-deliver.ts`)
```
// SPDX-License-Identifier: MIT

import { logger } from "@/lib/logger";
import { incMetric } from "@/lib/metrics-counters";
import { isSafeWebhookUrlAtDelivery } from "@/lib/webhook-url-guard";
import { RETRY_CONFIG } from "@/lib/retry-config";
import {
  fetchWithTimeout,
  getWebhookTimeoutMs,
  isTimeoutError,
} from "@/lib/timeout";
import crypto from "crypto";

export interface WebhookPayload {
  event: string;
  timestamp: string;
  data: Record<string, unknown>;
  /** Present and true only for integrator test events — never real payments. */
  test?: boolean;
}

export interface WebhookDeliveryResult {
  success: boolean;
  statusCode?: number;
  latencyMs: number;
  attempts: number;
  errorMessage?: string;
}

export const WEBHOOK_TIMESTAMP_HEADER = "X-OphirPay-Timestamp";
export const WEBHOOK_TIMESTAMP_TOLERANCE_SECONDS = 300;

export function webhookSignedInput(
  timestamp: string,
  canonicalBody: string
): string {
  return `${timestamp}.${canonicalBody}`;
}

export function canonicalizeWebhookBody(payload: WebhookPayload): string {
  return JSON.stringify({ ...payload, signature: "" });
}

export const BLOCKED_WEBHOOK_TARGET_ERROR =
  "Webhook target rejected by the 
```

## 3. Issue Specification Excerpt
```markdown
**Target Branch: integration/staging**

---

## Description

In `src/lib/webhook-deliver.ts` and subscriber verification examples, webhook signatures are compared against the expected digest. If string equality (`===`) is used instead of constant-time comparison, the check is susceptible to side-channel timing attacks that allow attackers to deduce valid signatures byte-by-byte.

## Proposed Solution

1. Audit all signature verification call-sites in `src/lib/webhook-deliver.ts` and `examples/webhook-verification/`.
2. Enforce `crypto.timingSafeEqual(Buffer.from(sigA), Buffer.from(sigB))` after verifying identical byte buffer lengths.
3. Add timing attack regression unit test asserting non-early-exit execution behavior.
4. Update developer documentation in `docs/webhook-verification.md`.

## Acceptance Criteria

- [ ] All signature comparisons utilize constant-time buffers
- [ ] Length mismatches return false without throwing uncaught exceptions
- [ ] Unit tests verify matching and non-matching digests

## Files to Modify
- src/lib/webhook-deliver.ts
- examples/webhook-verification/node-verifier.ts
- docs/webhook-verification.md

---

**Target Branch: integration/staging**
```

## 4. Existing Claim Activity (4)
- **@ayqy** (2026-10-15T01:40:33Z): `Hi @CodingAngel1 — I’m interested in the complete #1386 fix on integration/staging. The current verification guide already uses length-checked timingSafeEqual, `
- **@rain2002** (2026-10-15T02:41:37Z): `Hi @CodingAngel1   interested in #1386 as well. I have the crypto.timingSafeEqual length-checked fix ready for webhook-deliver.ts on integration/staging.`
- **@ahmedcompk** (2026-10-15T11:10:09Z): `Hi @CodingAngel1 — I would like to be assigned to #1386.  I am preparing the timing-safe HMAC verification patch targeting integration/staging: 1. Implementing `
- **@ciperx** (2026-10-15T16:06:15Z): `Implemented and opened PR #1483 (targets `integration/staging`).  - `verifyWebhookSignature()` in `src/lib/webhook-deliver.ts` now compares with `crypto.timingS`

## 5. Settlement & Claim Header
- Claim Command: `/claim #1386`
- Pull Request: https://github.com/lienhoatienphung-svg/OphirPay/pull/4
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`