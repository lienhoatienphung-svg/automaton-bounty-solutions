# Bounty Technical Analysis & Solution — `Parabola-org/parabola#11`

- **Target Issue**: [[Bounty: $90] Add ESLint with typescript-eslint and wire it into CI](https://github.com/Parabola-org/parabola/issues/11)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T20:40:10.927Z`

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
CI (`.github/workflows/ci.yml`) runs typecheck, tests, build, commitlint, and PR-title lint — but no static analysis of the code itself. `package.json` has no lint script and ESLint is not a devDependency. Rules that would have caught real classes of issues in this codebase — floating promises in the polling loops, unsafe `any` casts around signer types (`src/transfer.ts:254-269`), unused catches (`src/chains/stellar.ts:153-155`) — are unenforced, and contributors have no local lint feedback loop.

**Proposed Change**
Add `eslint` + `typescript-eslint` (flat config, `eslint.config.mjs`) with a pragmatic rule set: recommended plus `@typescript-eslint/no-floating-promises` and `@typescript-eslint/no-misused-promises` (high value for this async-heavy SDK), no type-aware rules that would require linting `dist/`. Add `pnpm lint` and `pnpm lint:fix` scripts, a `lint` job (or step in the existing job) in `.github/workflows/ci.yml`, and fix or consciously baseline any findings in the existing `src/`, `tests/`, `scripts/` code.

**Acceptance Criteria**

- `pnpm lint` passes on a clean checkout.
- Floating-promise and misused-promise rules are enabled and demonstrably fire (a `//
```

## 3. Existing Claim Activity (1)
- **@Kakarottoooo** (2026-10-15T20:38:54Z): `Hi, I'm interested in this scoped CI task. I checked package.json and the existing Node 20/22 CI: there is currently no lint script or ESLint dependency.  My pr`

## 4. Settlement & Claim Header
- Claim Command: `/claim #11`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`