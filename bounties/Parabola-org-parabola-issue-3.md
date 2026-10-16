# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#3`

- **Target Issue**: [[Bounty: $105] Tolerate transient Iris failures in getAttestation and resolveBurn](https://github.com/Parabola-org/parabola/issues/3)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-3](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-3)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/12](https://github.com/lienhoatienphung-svg/parabola/pull/12)
- **Inspected Source File**: `src/iris/poll.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T01:48:00.726Z`

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
`pollForAttestation` in `src/iris/poll.ts:133-170` tolerates up to 5 consecutive failures before giving up — the right policy against a public API. But `getAttestation` (lines 102-122), used by `resolveBurn` in `src/transfer.ts:285-304`, calls `pollOnce` exactly once and throws `IrisRequestError` on the first failure. So `resolveBurn`, the SDK's read-only "what did this burn commit to?" helper, is strictly less reliable than the polling path for no documented reason. A single dropped connection makes a caller believe the burn is unresolvable.

**Proposed Change**
Give `getAttestation` the same consecutive-failure tolerance as `pollForAttestation` (extract the shared constant and a small retry helper so the policy lives in one place). `getAttestation` should still make exactly one *successful* read — it must not wait for indexing like the poll loop does; only transient failures retry.

**Acceptance Criteria**

- `getAttestation` retries on `IrisRequestError`-class failures up to the shared consecutive-failure limit and succeeds when a retry succeeds.
- `getAttestation` still throws `AttestationNotReadyError` on 404 / empty messages without retrying (404 is an expected st
```

## 4. Existing Claim Activity (3)
- **@sparkysolutions10-pixel** (2026-10-15T20:22:53Z): `/claim #3  ### 🤖 MiroFish Autonomous Bug Resolution & Proof of Fix   ## 🛠️ Problem & Solution Overview  ### Issue Reference Fixes #3  ### Description of Fix T`
- **@Ollie520** (2026-10-15T20:23:13Z): `# Solution for [github/Parabola-org_parabola_3]: [Parabola-org/parabola] [Bounty: $105] Tolerate transient Iris failures in getAttestation and resolveBurn  - `
- **@yodakkak** (2026-10-15T20:43:19Z): `I am working on a focused PR for this issue (#3).`

## 5. Settlement & Claim Header
- Claim Command: `/claim #3`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/12
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`