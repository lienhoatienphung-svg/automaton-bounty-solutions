# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#2`

- **Target Issue**: [[Bounty: $105] Stop silently pricing Fast Transfers at zero when Iris returns no fast tier](https://github.com/Parabola-org/parabola/issues/2)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-2](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-2)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/1](https://github.com/lienhoatienphung-svg/parabola/pull/1)
- **Inspected Source File**: `src/iris/poll.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T01:27:35.562Z`

## 1. Repository Root Structure (`Parabola-org/parabola`)
- `.editorconfig`
- `.env.example`
- `.gitattributes`
- `.github`
- `.gitignore`
- `CHANGELOG.md`
- `CODE_OF_CONDUCT.md`
- `CONTRIBUTING.md`
- `INTEGRATION.md`
- `LICENSE`
- `README.md`
- `SECURITY.md`
- `commitlint.config.mjs`
- `demos`
- `examples`
- `package.json`
- `pnpm-lock.yaml`
- `pnpm-workspace.yaml`
- `scripts`
- `src`
- `tests`
- `tsconfig.json`
- `tsup.config.ts`
- `vitest.config.ts`
- `website`

## 2. Inspected Source File (`src/iris/poll.ts`)
```
import { IRIS_MAINNET_BASE_URL, IRIS_SANDBOX_BASE_URL, DEFAULT_POLL_INTERVAL_MS, DEFAULT_POLL_TIMEOUT_MS } from "../constants.js";
import { AttestationNotReadyError, IrisRequestError } from "../errors.js";
import type { IrisMessage, IrisMessagesResponse, IrisFeesResponse } from "./types.js";

export function irisBaseUrl(useSandbox: boolean): string {
  return useSandbox ? IRIS_SANDBOX_BASE_URL : IRIS_MAINNET_BASE_URL;
}

/** Fetches the current Fast Transfer fee (in basis points) for a source/destination domain pair. */
export async function fetchFastTransferFeeBps(
  sourceDomain: number,
  destDomain: number,
  useSandbox: boolean,
): Promise<number> {
  const url = `${irisBaseUrl(useSandbox)}burn/USDC/fees/${sourceDomain}/${destDomain}`;
  const res = await fetch(url);
  if (!res.ok) {
    throw new Error(`Iris fees request failed: ${res.status} ${res.statusText}`);
  }
  const body = (await res.json()) as IrisFeesResponse;
  const fastEntry = body.find((entry) => entry.finalityThreshold <= 1000);
  return fastEntry?.minimumFee ?? 0;
}

/**
 * Consecutive unusable responses tolerated before polling gives up. A single 5xx or dropped
 * connection is normal against a public API, a
```

## 3. Issue Specification Excerpt
```markdown
**Context**
`fetchFastTransferFeeBps` in `src/iris/poll.ts:10-23` does `body.find((entry) => entry.finalityThreshold <= 1000)` and falls back to `return fastEntry?.minimumFee ?? 0`. If Iris changes its response shape, returns an empty array, or ships a tier with a different threshold, every fast transfer is silently quoted a zero fee — in `transfer()` this flows into `feeRaw = 0` and a `TransferResult.fee` of `"0"`, and in `estimateFee` it produces a free-looking quote. The same function also throws a bare `Error` on HTTP failure (line 18) even though `IrisRequestError` exists specifically for this service and carries the status code.

**Proposed Change**
Throw `IrisRequestError` (with status) on non-OK responses. When no fast-tier entry is found in a successful response, throw a descriptive error instead of returning 0 — an unpriced fee is a failure, not a free transfer. Keep returning `minimumFee` for the normal case unchanged.

**Acceptance Criteria**

- Non-OK Iris fees response rejects with `IrisRequestError` and the HTTP status attached.
- A 200 response with no entry at or below finality threshold 1000 rejects with an error naming the domain pair; it does not resolve to 0.
-
```

## 4. Existing Claim Activity (2)
- **@fy-god** (2026-10-15T21:34:54Z): `Implemented in canonical PR #22: https://github.com/Parabola-org/parabola/pull/22  It changes the missing fast-tier case from a zero fee to a descriptive `IrisR`
- **@ayqy** (2026-10-16T01:23:40Z): `Hi, I’m interested in the complete fee-handling fix: preserving normal fees and the exact 1000 threshold, rejecting a missing fast tier with the domain pair, an`

## 5. Settlement & Claim Header
- Claim Command: `/claim #2`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`