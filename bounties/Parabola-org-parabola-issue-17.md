# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#17`

- **Target Issue**: [[Bounty: $60] Docs: add a "Failure modes and recovery" guide](https://github.com/Parabola-org/parabola/issues/17)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-17](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-17)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/18](https://github.com/lienhoatienphung-svg/parabola/pull/18)
- **Inspected Source File**: `src/errors.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T22:42:58.826Z`

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
The README documents the happy path well, and `src/errors.ts` has excellent inline rationale — but a integrator debugging a failed mainnet transfer has to assemble the recovery story by reading source. The pieces are scattered: `TransferError.burnTxHash` (recover via `completeMint`), `AttestationNotReadyError` (retryable, burn is safe), `SubmissionTimeoutError` (hash exists, outcome unknown — check the chain before retrying), `IrisRequestError` (Circle-side outage, retry), and `resolveBurn` for inspecting a burn you didn't produce.

**Proposed Change**
Add a `docs/` page (or a major README section, matching wherever long-form docs currently live — check `INTEGRATION.md` first and extend it if that's the right home) covering: the transfer lifecycle diagram in prose, each error class with what it means for funds and what to do next, a worked `completeMint` recovery example for both directions, and guidance on choosing `pollTimeout`. Link the new section from the README's relevant existing sections.

**Acceptance Criteria**

- Every error class exported from `src/index.ts` appears in the guide with meaning + recommended action.
- At least one complete code example: catch `
```

## 4. Existing Claim Activity (5)
- **@Ollie520** (2026-10-15T20:13:14Z): `# Solution for [github/Parabola-org_parabola_17]: [Parabola-org/parabola] [Bounty: $60] Docs: add a "Failure modes and recovery" guide  - **Reward:** $60.00 U`
- **@Ollie520** (2026-10-15T20:13:18Z): `# Solution for [github/Parabola-org_parabola_17]: [Parabola-org/parabola] [Bounty: $60] Docs: add a "Failure modes and recovery" guide  - **Reward:** $60.00 U`
- **@yodakkak** (2026-10-15T20:49:05Z): `I am working on a focused PR for this issue (#17).`
- **@ayqy** (2026-10-15T21:57:49Z): `Hi, is the complete recovery-guide work in #17 still available as a paid assignment for a new contributor, given #39 and #43?  I understand the scope is a docs-`
- **@yggdrasilworld** (2026-10-15T22:28:37Z): `/claim #17  Settlement wallet (Base USDC): `0xfBa20992174e777eaBbdd7D10755699B84d030Fd``

## 5. Settlement & Claim Header
- Claim Command: `/claim #17`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/18
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`