# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#5`

- **Target Issue**: [[Bounty: $125] Add AbortSignal support across transfer, completeMint, and attestation polling](https://github.com/Parabola-org/parabola/issues/5)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-5](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-5)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/10](https://github.com/lienhoatienphung-svg/parabola/pull/10)
- **Inspected Source File**: `src/iris/poll.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T00:57:53.874Z`

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
Nothing in the SDK accepts an `AbortSignal`. `pollForAttestation` (`src/iris/poll.ts:133-170`), `pollTransactionStatus` (`src/chains/stellar.ts:71-86`), and `waitForAllowance`/`retryOnTransientRpcLag` (`src/chains/stellar.ts:210-294`) all run `while` loops with fixed deadlines and no external cancellation. A service shutting down, a user navigating away from the demo, or a request-scoped timeout in a web backend cannot stop an in-flight transfer. This matters most after the burn: the README and `TransferError` docs promise the caller keeps `burnTxHash` for recovery, so an abort that discards it would violate the SDK's core safety contract.

**Proposed Change**
Thread an optional `signal?: AbortSignal` through `TransferOptionsBase` and `CompleteMintOptions`, honoring it in every polling/sleep loop (abortable sleep, not `setTimeout` fire-and-forget). Semantics: aborting before the burn throws a plain `AbortError` with nothing lost; aborting after the burn has been submitted throws a `TransferError` that still carries `burnTxHash` and sets `code` appropriately, so the recovery path is identical to any other post-burn failure. Fetches to Iris should pass the signal through.
```

## 4. Existing Claim Activity (2)
- **@yodakkak** (2026-10-15T20:43:20Z): `I am working on a focused PR for this issue (#5).`
- **@yggdrasilworld** (2026-10-15T22:28:33Z): `/claim #5  Settlement wallet (Base USDC): `0xfBa20992174e777eaBbdd7D10755699B84d030Fd``

## 5. Settlement & Claim Header
- Claim Command: `/claim #5`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/10
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`