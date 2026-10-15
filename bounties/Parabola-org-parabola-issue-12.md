# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#12`

- **Target Issue**: [[Bounty: $75] Expose retry/backoff knobs for Stellar allowance wait and RPC-lag retry](https://github.com/Parabola-org/parabola/issues/12)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: [fix/issue-12](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-12)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/8](https://github.com/lienhoatienphung-svg/parabola/pull/8)
- **Inspected Source File**: `src/chains/stellar.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T20:42:31.658Z`

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

## 2. Inspected Source File (`src/chains/stellar.ts`)
```
import {
  Contract,
  TransactionBuilder,
  BASE_FEE,
  Address,
  nativeToScVal,
  scValToNative,
  rpc,
} from "@stellar/stellar-sdk";
import { stellarConfig, STELLAR_TX_TIMEOUT_SECONDS, STELLAR_CONFIRMATION_TIMEOUT_MS, STELLAR_INCLUSION_FEE } from "../constants.js";
import type { StellarSigner, Network } from "../types.js";
import { SubmissionTimeoutError } from "../errors.js";

function getServer(network: Network, rpcUrl?: string): rpc.Server {
  return new rpc.Server(rpcUrl ?? stellarConfig(network).sorobanRpcUrl);
}

async function signTransaction(
  xdr: string,
  signer: StellarSigner,
  network: Network,
): Promise<string> {
  const passphrase = stellarConfig(network).networkPassphrase;
  if (signer.signTransaction) {
    return signer.signTransaction(xdr, passphrase);
  }
  if (signer.keypair) {
    const tx = TransactionBuilder.fromXDR(xdr, passphrase);
    tx.sign(signer.keypair);
    return tx.toXDR();
  }
  throw new Error("StellarSigner must provide either a keypair or a signTransaction function");
}

/**
 * Simulates, prepares, signs, and submits a Soroban contract invocation, then
 * polls the RPC server until the transaction is confirmed. Returns the tx hash.
 */
```

## 3. Issue Specification Excerpt
```markdown
**Context**
Two recovery loops in `src/chains/stellar.ts` have hard-coded timing with no caller control: `waitForAllowance` (lines 210-227) does 6 attempts × 1500ms, and `retryOnTransientRpcLag` (lines 278-294) does 3 attempts × 2000ms. A backend on a slow RPC provider may need longer; a latency-sensitive path may want faster failure. The knobs are currently compile-time constants, while every other timing concern in the SDK (`pollInterval`, `pollTimeout`) is already a documented option.

**Proposed Change**
Add optional fields to `TransferOptionsBase` (e.g. `stellarRetryAttempts?`, `stellarRetryDelayMs?` — naming up to the contributor, but keep it one pair applied to both loops unless there's a strong reason not to), thread them through `burnUsdcOnStellar` / `approveUsdcOnStellar`, and default to today's values so behavior is unchanged when omitted. Document the new options in the README options table/section alongside `pollInterval`.

**Acceptance Criteria**

- Defaults preserve exact current attempt counts and delays (existing tests green).
- Custom attempts/delay values are honored by both `waitForAllowance` and `retryOnTransientRpcLag`, verified by tests with mocked timers.
- 
```

## 4. Existing Claim Activity (2)
- **@fate-lab** (2026-10-15T20:36:08Z): `Hi! I've completed this issue in #27. All acceptance criteria are covered, and typecheck, tests and build pass. Once it's reviewed and merged, how will the $75 `
- **@Ollie520** (2026-10-15T20:37:52Z): `# Solution for [github/Parabola-org_parabola_12]: [Parabola-org/parabola] [Bounty: $75] Expose retry/backoff knobs for Stellar allowance wait and RPC-lag retry`

## 5. Settlement & Claim Header
- Claim Command: `/claim #12`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/8
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`