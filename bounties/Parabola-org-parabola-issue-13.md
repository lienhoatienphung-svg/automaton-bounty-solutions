# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#13`

- **Target Issue**: [[Bounty: $75] Unit tests for src/errors.ts and a public export surface snapshot](https://github.com/Parabola-org/parabola/issues/13)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: DeepPulse Unindexed API & Algora PR Bounty Harvester
- **Fork Fix Branch**: [fix/issue-13](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-13)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/3](https://github.com/lienhoatienphung-svg/parabola/pull/3)
- **Inspected Source File**: `src/errors.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T20:37:49.752Z`

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

## 2. Inspected Source File (`src/errors.ts`)
```
/**
 * Thrown by transfer() for any failure that happens after the source-chain burn has
 * already succeeded: attestation polling (timeout or otherwise), or the destination-chain
 * mint call. Carries burnTxHash so the caller can recover with completeMint() instead of
 * losing track of funds that already left the source chain.
 */
export class TransferError extends Error {
  readonly burnTxHash: string;
  readonly attestationHash?: string;
  /**
   * Machine-readable discriminator for the wrapped failure, set when the underlying error
   * has a type a caller can act on. `"ATTESTATION_NOT_READY"` means the burn is real and
   * the attestation simply has not arrived yet, so the caller should retry rather than
   * treat the transfer as lost. Undefined for failures with no more specific classification.
   */
  readonly code?: TransferErrorCode;

  constructor(
    message: string,
    burnTxHash: string,
    attestationHash?: string,
    code?: TransferErrorCode,
  ) {
    super(message);
    this.name = "TransferError";
    this.burnTxHash = burnTxHash;
    this.attestationHash = attestationHash;
    this.code = code;
  }
}

export type TransferErrorCode = "ATTESTATION_NOT_READY"
```

## 3. Issue Specification Excerpt
```markdown
**Context**
`src/errors.ts` defines the SDK's entire failure taxonomy — `TransferError`, `AttestationNotReadyError`, `IrisRequestError`, `SubmissionTimeoutError` — and there is no `tests/errors.test.ts`. Nothing asserts constructor wiring (`burnTxHash` attachment, optional `code`/`status`), `instanceof` behavior after a bundling pass, or that `src/index.ts` actually exports the public API the README documents. A refactor that drops an export or renames a field currently sails through CI until a user hits it at runtime.

**Proposed Change**
Add `tests/errors.test.ts` covering each error class's fields and prototype chain, including the `TransferErrorCode` discriminator. Add `tests/exports.test.ts` that imports the built package entry (`dist` or `src/index.ts`) and asserts the exact sorted list of exported names (values and types) against a checked-in snapshot, so any public surface change is a deliberate diff.

**Acceptance Criteria**

- Every error class has constructor/field/instanceof coverage, including all-optional-args variants.
- Export snapshot test fails when an export is added or removed, with a clear diff message.
- Snapshot is generated from the real entry point, not a h
```

## 4. Existing Claim Activity (2)
- **@Ollie520** (2026-10-15T20:25:25Z): `# Solution for [github/Parabola-org_parabola_13]: [Parabola-org/parabola] [Bounty: $75] Unit tests for src/errors.ts and a public export surface snapshot  - *`
- **@sparkysolutions10-pixel** (2026-10-15T20:26:19Z): `/claim #13  ### 🤖 MiroFish Autonomous Bug Resolution & Proof of Fix   ## 🛠️ Problem & Solution Overview  ### Issue Reference Fixes #13  ### Description of Fix`

## 5. Settlement & Claim Header
- Claim Command: `/claim #13`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/3
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`