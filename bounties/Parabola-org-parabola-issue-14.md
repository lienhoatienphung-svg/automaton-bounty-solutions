# Bounty Technical Analysis & Solution — `Parabola-org/parabola#14`

- **Target Issue**: [[Bounty: $75] Demo app: recovery flow for post-burn failures using TransferError.burnTxHash](https://github.com/Parabola-org/parabola/issues/14)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: DeepPulse Unindexed API & Algora PR Bounty Harvester
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T20:11:45.826Z`

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

## 2. Issue Specification Excerpt
```markdown
**Context**
`demos/wallet-transfer-demo` drives real transfers but has no path for the failure mode the SDK bends over backwards to support: the burn succeeded, then attestation or mint failed. `TransferError` carries `burnTxHash` exactly so a caller can resume with `completeMint()` (`src/errors.ts:7-30`, README recovery docs). In the demo, a post-burn failure presumably surfaces as a dead-end error toast, and the user has no way to retry the mint without re-burning — which would double-spend.

**Proposed Change**
Detect `TransferError` with a non-empty `burnTxHash` in the demo's transfer handler. Show a recovery UI: display the burn hash (copyable), explain that funds left the source chain safely, and offer a "Complete transfer" button that calls `completeMint()` with the stored direction, destination signer, and network. Persist enough in-memory state (source chain, destination chain, network) to make that call; no need for cross-reload persistence.

**Acceptance Criteria**

- A post-burn failure shows the recovery UI with the burn hash, not a generic error.
- "Complete transfer" calls `completeMint` with correct params and surfaces its result.
- Pre-burn failures keep showing a 
```

## 3. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 4. Settlement & Claim Header
- Claim Command: `/claim #14`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`