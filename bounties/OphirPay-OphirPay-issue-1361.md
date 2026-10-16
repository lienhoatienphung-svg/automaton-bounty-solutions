# Bounty Technical Analysis, Patch & PR — `OphirPay/OphirPay#1361`

- **Target Issue**: [Add cursor-based pagination and sorting to /api/audit-log route](https://github.com/OphirPay/OphirPay/issues/1361)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: SovereignFund Grant, Crowdfunding & VC Capital Desk
- **Fork Fix Branch**: [fix/issue-1361](https://github.com/lienhoatienphung-svg/OphirPay/tree/fix/issue-1361)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/OphirPay/pull/8](https://github.com/lienhoatienphung-svg/OphirPay/pull/8)
- **Inspected Source File**: `src/app/api/audit-log/route.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T03:15:36.744Z`

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

## 2. Inspected Source File (`src/app/api/audit-log/route.ts`)
```
// SPDX-License-Identifier: MIT

import { withApiAuth } from "@/lib/api-auth";
import { successResponse, handleApiError, validationError } from "@/lib/api-response";
import prisma from "@/lib/prisma";
import { withRequestLogging } from "@/lib/request-logging";
import {
  auditLogQuerySchema,
  parseAuditTimestamp,
  readAuditLogTotalCount,
  readAuditEntryById,
  type AuditLogEntry,
} from "@/lib/audit-log";

/**
 * GET /api/audit-log
 *
 * Returns audit log entries. Requires API-key authentication with the
 * `admin` scope. Supports offset pagination (`page` / `limit`) and combined
 * filters: `actor` (substring, case-insensitive), `action` (exact), a
 * `since` / `until` timestamp range (Unix seconds or ISO 8601), and `order`
 * (asc | desc).
 *
 * `source` selects the backing store:
 *   - `db`       → persisted audit entries (refund lifecycle history, issue
 *                  #365), queryable by action/target;
 *   - `contract` → the on-chain immutable audit ledger (default), filtered
 *                  server-side with offset pagination;
 *   - `all`      → DB entries plus matching on-chain entries.
 *
 * For the on-chain sources, filtering is applied across the full ledger,
```

## 3. Issue Specification Excerpt
```markdown
**Target Branch: integration/staging**

---

## Description

The audit log endpoint `src/app/api/audit-log/route.ts` currently fetches entries using basic offset-based queries (`skip`/`take`). For enterprise accounts with tens of thousands of payment audit logs, deep offset queries cause degraded Postgres query execution plans and high latency.

## Proposed Solution

1. Implement cursor-based pagination (`cursor: { id }`) using Prisma's indexed `createdAt` and `id` keys.
2. Return a standardized response payload: `{ data, nextCursor, hasMore }`.
3. Support directional sorting (`asc` / `desc`) by timestamp.
4. Update API documentation in `docs/API_GUIDE.md`.

## Acceptance Criteria

- [ ] Cursor-based pagination returns deterministic non-overlapping pages
- [ ] Query performance stays under 25ms regardless of table size
- [ ] Automated integration test tests cursor navigation through multi-page sets

## Files to Modify
- src/app/api/audit-log/route.ts
- src/lib/prisma.ts
- docs/API_GUIDE.md

---

**Target Branch: integration/staging**
```

## 4. Existing Claim Activity (1)
- **@lienhoatienphung-svg** (2026-10-15T11:35:58Z): `Hi @CodingAngel1 — I would like to claim and be assigned to #1361 (**Add cursor-based pagination and sorting to /api/audit-log route**).  Per CONTRIBUTING.md (S`

## 5. Settlement & Claim Header
- Claim Command: `/claim #1361`
- Pull Request: https://github.com/lienhoatienphung-svg/OphirPay/pull/8
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`