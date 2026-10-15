# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#9`

- **Target Issue**: [[Bounty: $90] Reject unsupported CCTP message versions in decodeCctpMessage](https://github.com/Parabola-org/parabola/issues/9)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-9](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-9)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/9](https://github.com/lienhoatienphung-svg/parabola/pull/9)
- **Inspected Source File**: `src/utils/message.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T20:46:43.959Z`

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

## 2. Inspected Source File (`src/utils/message.ts`)
```
import { decodeStellarForwardHook } from "./encoding.js";

/**
 * Byte offsets into the CCTP V2 message and its burn body, taken from Circle's reference
 * contracts (circlefin/evm-cctp-contracts, src/messages/v2/MessageV2.sol and
 * src/messages/v2/BurnMessageV2.sol) rather than inferred. The header is a fixed 148 bytes
 * for every CCTP V2 message; the token-transfer body that follows is 228 bytes, with any
 * hook data appended after it, so a message carrying a hook is longer than 376.
 *
 * Cross-checked against a live testnet attestation from Circle's Iris sandbox, whose
 * message decodes at these offsets to a 0x3600...0000 burn token, an amount of 0xf4240
 * (1.000000 USDC), and a 56-byte Stellar strkey inside the hook data.
 */
const HEADER_OFFSET = {
  version: 0,
  sourceDomain: 4,
  destinationDomain: 8,
  nonce: 12,
  sender: 44,
  recipient: 76,
  destinationCaller: 108,
  minFinalityThreshold: 140,
  finalityThresholdExecuted: 144,
} as const;

const BODY_OFFSET = {
  version: 148,
  burnToken: 152,
  mintRecipient: 184,
  amount: 216,
  messageSender: 248,
  maxFee: 280,
  feeExecuted: 312,
  expirationBlock: 344,
  hookData: 376,
} as const;

/** Every CCTP V2 messa
```

## 3. Issue Specification Excerpt
```markdown
**Context**
`decodeCctpMessage` in `src/utils/message.ts:88-121` validates only minimum length, then reads every header and body field at hard-coded V2 offsets (lines 14-36, cross-checked against Circle's reference contracts). It never checks the `version` header field or `burnBodyVersion`. If Circle ships a V3 message format with different field layout, or a non-burn body ever reaches this decoder, the function returns a confidently wrong decode — wrong amount, wrong recipient — and `completeMint` / `resolveBurn` would act on it. For a function whose output decides where funds get minted, silent misreads are the worst failure mode.

**Proposed Change**
After the length check, read `version` and `burnBodyVersion` and throw a descriptive error when either is unsupported (accept exactly the versions this SDK decodes today: header version 2, burn body version 2 — verify the exact expected values against `src/utils/message.ts` comments and Circle's contracts before hard-coding). The error message should name the found and expected versions.

**Acceptance Criteria**

- A message with a non-V2 header version throws with both versions in the message; nothing is decoded.
- A V2 header with
```

## 4. Existing Claim Activity (1)
- **@yodakkak** (2026-10-15T20:33:28Z): `I am working on a focused PR for this issue (#9).`

## 5. Settlement & Claim Header
- Claim Command: `/claim #9`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/9
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`