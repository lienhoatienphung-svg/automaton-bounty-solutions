# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#7`

- **Target Issue**: [[Bounty: $90] Make estimateFee agree with transfer() on maxFee and maxWait fallback](https://github.com/Parabola-org/parabola/issues/7)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-7](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-7)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/14](https://github.com/lienhoatienphung-svg/parabola/pull/14)
- **Inspected Source File**: `src/transfer.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T00:15:55.164Z`

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

## 2. Inspected Source File (`src/transfer.ts`)
```
import type {
  TransferParams,
  TransferResult,
  TransferMode,
  ArcSigner,
  StellarSigner,
  ChainId,
  Signer,
  Network,
  CompleteMintParams,
  CompleteMintResult,
  ResolveBurnParams,
  ResolvedBurn,
} from "./types.js";
import {
  ARC_DOMAIN,
  STELLAR_DOMAIN,
  stellarConfig,
  FINALITY_THRESHOLD_STANDARD,
  FINALITY_THRESHOLD_FAST,
  DEFAULT_POLL_INTERVAL_MS,
  DEFAULT_POLL_TIMEOUT_MS,
} from "./constants.js";
import { fetchFastTransferFeeBps, pollForAttestation, getAttestation } from "./iris/poll.js";
import { TransferError, SubmissionTimeoutError, AttestationNotReadyError } from "./errors.js";
import { toRawAmount, fromRawAmount, decimalsForChain } from "./utils/amount.js";
import { parseUsdcAmount, stellarAddressToBytes32, evmAddressToBytes32, encodeStellarForwardHook } from "./utils/encoding.js";
import { decodeCctpMessage } from "./utils/message.js";
import { approveUsdcOnArc, burnUsdcOnArcWithStellarForward, receiveMessageOnArc } from "./chains/arc.js";
import {
  approveUsdcOnStellar,
  burnUsdcOnStellar,
  mintAndForwardOnStellar,
  checkStellarRecipientReady,
} from "./chains/stellar.js";

const FAST_ESTIMATED_DURATION_SECONDS = 15;

function domainFor(chain: "
```

## 3. Issue Specification Excerpt
```markdown
**Context**
`transfer()` in `src/transfer.ts:56-71` can silently downgrade a fast transfer to standard when the quoted fee exceeds `options.maxFee` or the fixed 15s fast estimate exceeds `options.maxWait`. `estimateFee` in `src/estimate.ts:15-39` knows nothing about either knob: it always reports fast as available and quotes the current fee. A caller that shows the `estimateFee` result to a user and then calls `transfer()` with `maxFee` set can charge a different mode and fee than quoted — the quote is decorative.

**Proposed Change**
Extend `EstimateFeeParams` with optional `maxFee` and `maxWait`, and implement the same decision logic `transfer()` uses: when the quoted fast fee exceeds `maxFee`, or the fast duration estimate exceeds `maxWait`, return a `standard` estimate. Extract the shared decision into a small pure helper used by both `transfer()` and `estimateFee` so the two cannot drift again.

**Acceptance Criteria**

- `estimateFee` with `maxFee` below the current Iris fast fee returns `transferMode: "standard"` and `protocolFee: "0"`.
- `estimateFee` with `maxWait` below the fast duration estimate returns standard.
- The fallback decision logic has a single implementation 
```

## 4. Existing Claim Activity (3)
- **@fy-god** (2026-10-15T20:44:01Z): `Implemented in #23. Local verification: pnpm test (116 passed), pnpm run typecheck, pnpm run build.`
- **@fy-god** (2026-10-15T20:53:47Z): `Update on #23: `estimateFee()` now calls the same pure `canUseFastTransfer` policy as `transfer()`, including both `maxWait` and the quoted raw `maxFee`. It ret`
- **@yggdrasilworld** (2026-10-16T00:11:32Z): `/claim #7  Settlement wallet (Base USDC): `0xfBa20992174e777eaBbdd7D10755699B84d030Fd``

## 5. Settlement & Claim Header
- Claim Command: `/claim #7`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/14
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`