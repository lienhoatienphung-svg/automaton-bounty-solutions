# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#6`

- **Target Issue**: [[Bounty: $125] Add structured progress callbacks to transfer()](https://github.com/Parabola-org/parabola/issues/6)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: Pending fork sync
- **Pull Request**: Ready on branch fix/issue-6
- **Inspected Source File**: `src/transfer.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T20:23:09.657Z`

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
`transfer()` in `src/transfer.ts:43-139` runs up to four distinct stages — recipient readiness check, approve, burn (+ confirmation), attestation polling, mint — with no way for a caller to observe progress except by parsing thrown errors after the fact. The README positions transfer observability as where this project is headed. Today a long standard transfer is a silent gap of up to `pollTimeout` (default 300s, `src/constants.ts:80`). Services and the demo app cannot show stage-level status, and operators cannot metric per-stage durations even though `durationMs` in `TransferResult` already proves timing is interesting.

**Proposed Change**
Add an optional `options.onProgress?: (event: TransferProgressEvent) => void` where `TransferProgressEvent` is a discriminated union with a `stage` field (`"recipient-check" | "approve" | "burn-submitted" | "burn-confirmed" | "attestation" | "mint-submitted" | "mint-confirmed"`) plus relevant payloads (tx hashes as they become available, timestamps). Emit events at the existing stage boundaries in `transfer()`; do not change any control flow. Callback exceptions must not break the transfer (swallow or defer to `console.error`-free 
```

## 4. Existing Claim Activity (1)
- **@sparkysolutions10-pixel** (2026-10-15T20:15:50Z): `/claim #6  ### 🤖 MiroFish Autonomous Bug Resolution & Proof of Fix   ## 🛠️ Problem & Solution Overview  ### Issue Reference Fixes #6  ### Description of Fix T`

## 5. Settlement & Claim Header
- Claim Command: `/claim #6`
- Pull Request: N/A
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`