# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#4`

- **Target Issue**: [[Bounty: $105] checkStellarRecipientReady must not report RPC outages as missing accounts](https://github.com/Parabola-org/parabola/issues/4)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Fork Fix Branch**: [fix/issue-4](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-4)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/4](https://github.com/lienhoatienphung-svg/parabola/pull/4)
- **Inspected Source File**: `src/chains/stellar.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T01:03:47.660Z`

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
`checkStellarRecipientReady` in `src/chains/stellar.ts:144-177` wraps `server.getAccount(recipient)` in a bare `catch` that returns `{ exists: false, hasTrustline: false, ready: false }`. Any failure — DNS error, RPC 503, rate limit on the public mainnet endpoint (which `src/constants.ts:49-52` explicitly warns is rate-limited) — is indistinguishable from an account that genuinely was never funded. `assertStellarRecipientReady` in `src/transfer.ts:207-223` then throws "recipient does not exist yet. It must be funded with at least the minimum XLM reserve", sending the caller down the wrong remediation path for what is actually an infrastructure problem.

**Proposed Change**
Inspect the error from `getAccount` and only map the Stellar SDK's account-not-found condition to `exists: false`. Anything else (transport errors, 5xx responses) should propagate as `IrisRequestError`-style infrastructure failure — or a new small error type if that fits better — so callers can retry instead of instructing end users to fund an account that may already exist.

**Acceptance Criteria**

- The SDK's account-not-found error still yields `{ exists: false, hasTrustline: false, ready: false }
```

## 4. Existing Claim Activity (4)
- **@fate-lab** (2026-10-15T20:36:03Z): `Hi! I've completed this issue in #26. All acceptance criteria are covered, and typecheck, tests and build pass. Once it's reviewed and merged, how will the $105`
- **@yggdrasilworld** (2026-10-15T22:28:30Z): `/claim #4  Settlement wallet (Base USDC): `0xfBa20992174e777eaBbdd7D10755699B84d030Fd``
- **@sparkysolutions10-pixel** (2026-10-15T23:06:52Z): `/claim #4  I have implemented and submitted a complete, production-grade fix in PR #62: https://github.com/Parabola-org/parabola/pull/62  ### Summary of Impleme`
- **@yggdrasilworld** (2026-10-15T23:26:43Z): `Heads up — I claimed this earlier at 22:28 UTC with `/claim` and a settlement wallet, and the implementation is already up for review at #58 (opened 22:42 UTC):`

## 5. Settlement & Claim Header
- Claim Command: `/claim #4`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/4
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`