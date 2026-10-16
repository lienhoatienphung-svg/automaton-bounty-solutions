# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#19`

- **Target Issue**: [[Bounty: $45] Validate input to bytes32ToStellarAddress](https://github.com/Parabola-org/parabola/issues/19)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: DeepPulse Unindexed API & Algora PR Bounty Harvester
- **Fork Fix Branch**: [fix/issue-19](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-19)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/19](https://github.com/lienhoatienphung-svg/parabola/pull/19)
- **Inspected Source File**: `src/utils/encoding.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T00:28:07.063Z`

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

## 2. Inspected Source File (`src/utils/encoding.ts`)
```
import { StrKey } from "@stellar/stellar-sdk";
import { toHex, pad } from "viem";

/**
 * Translates a Stellar address (G... account or C... contract strkey) into the
 * bytes32 hex format CCTP expects as a mint recipient / hook payload field.
 *
 * Circle's CCTP V2 message format encodes non-EVM recipients as 32-byte values.
 * For Stellar this is the raw ed25519 public key (G...) or contract id (C...)
 * left-padded to 32 bytes, matching StrKey.decodeContract / decodeEd25519PublicKey.
 */
export function stellarAddressToBytes32(address: string): `0x${string}` {
  let raw: Buffer;
  if (StrKey.isValidEd25519PublicKey(address)) {
    raw = StrKey.decodeEd25519PublicKey(address);
  } else if (StrKey.isValidContract(address)) {
    raw = StrKey.decodeContract(address);
  } else {
    throw new Error(`Invalid Stellar address: ${address}`);
  }
  if (raw.length !== 32) {
    throw new Error(`Expected 32-byte Stellar key, got ${raw.length} bytes`);
  }
  return pad(toHex(raw), { size: 32 });
}

/** Inverse of stellarAddressToBytes32 for ed25519 public keys (G... accounts). */
export function bytes32ToStellarAddress(bytes32: `0x${string}`): string {
  const hex = bytes32.startsWith("0x")
```

## 3. Issue Specification Excerpt
```markdown
**Context**
`bytes32ToStellarAddress` in `src/utils/encoding.ts:28-32` does `Buffer.from(hex, "hex")` with no validation and passes the result straight to `StrKey.encodeEd25519PublicKey`. `Buffer.from` silently truncates at the first non-hex character and accepts odd-length strings by dropping the leading nibble, so garbage input produces a garbage-but-plausible `G...` address instead of an error. Its sibling `stellarAddressToBytes32` (lines 12-25) validates both directions of the strkey round trip; this inverse got missed. It's exported from the package via the encoding utilities consumers import.

**Proposed Change**
Mirror the validation discipline of `evmAddressToBytes32` (lines 120-131): require an `0x`-prefixed, even-length, pure-hex string of exactly 64 hex chars (32 bytes) before decoding, and throw a descriptive error otherwise.

**Acceptance Criteria**

- 32-byte valid hex input round-trips: `bytes32ToStellarAddress(stellarAddressToBytes32(g)) === g` for sample G-addresses.
- Non-hex characters, odd lengths, wrong byte lengths, and missing `0x` prefix each throw with a clear message.
- Contract (C...) round-trip behavior is documented — either supported explicitly or reje
```

## 4. Existing Claim Activity (4)
- **@Ollie520** (2026-10-15T20:09:53Z): `# Solution for [github/Parabola-org_parabola_19]: [Parabola-org/parabola] [Bounty: $45] Validate input to bytes32ToStellarAddress  - **Reward:** $45.00 USDC `
- **@sparkysolutions10-pixel** (2026-10-15T20:12:40Z): `/claim #19  ### 🤖 MiroFish Autonomous Bug Resolution & Proof of Fix   ## 🛠️ Problem & Solution Overview  ### Issue Reference Fixes #19  ### Description of Fix`
- **@yodakkak** (2026-10-15T20:33:29Z): `I am working on a focused PR for this issue (#19).`
- **@phauranta-naresh** (2026-10-16T00:19:50Z): `/claim`

## 5. Settlement & Claim Header
- Claim Command: `/claim #19`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/19
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`