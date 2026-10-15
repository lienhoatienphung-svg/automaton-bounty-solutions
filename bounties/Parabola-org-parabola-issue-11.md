# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#11`

- **Target Issue**: [[Bounty: $90] Add ESLint with typescript-eslint and wire it into CI](https://github.com/Parabola-org/parabola/issues/11)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-11](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-11)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/13](https://github.com/lienhoatienphung-svg/parabola/pull/13)
- **Inspected Source File**: `.github/workflows/ci.yml`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T20:46:09.834Z`

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

## 2. Inspected Source File (`.github/workflows/ci.yml`)
```
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  typecheck-test-build:
    name: Typecheck, Test & Build (Node ${{ matrix.node-version }})
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [20, 22]
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node-version }}
          cache: pnpm
      - run: pnpm install --frozen-lockfile
      - run: pnpm typecheck
      - run: pnpm test
      - run: pnpm build

  commitlint:
    name: Commit Messages
    runs-on: ubuntu-latest
    if: github.event_name == 'pull_request'
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: wagoid/commitlint-github-action@v6
        with:
          configFile: commitlint.config.mjs

  pr-lint:
    name: PR Title
    runs-on: ubuntu-latest
    if: github.event_name == 'pull_request'
    steps:
      - uses: amannn/action-semantic-pull-request@v6
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          types: |
            feat
            fix
            d
```

## 3. Issue Specification Excerpt
```markdown
**Context**
CI (`.github/workflows/ci.yml`) runs typecheck, tests, build, commitlint, and PR-title lint — but no static analysis of the code itself. `package.json` has no lint script and ESLint is not a devDependency. Rules that would have caught real classes of issues in this codebase — floating promises in the polling loops, unsafe `any` casts around signer types (`src/transfer.ts:254-269`), unused catches (`src/chains/stellar.ts:153-155`) — are unenforced, and contributors have no local lint feedback loop.

**Proposed Change**
Add `eslint` + `typescript-eslint` (flat config, `eslint.config.mjs`) with a pragmatic rule set: recommended plus `@typescript-eslint/no-floating-promises` and `@typescript-eslint/no-misused-promises` (high value for this async-heavy SDK), no type-aware rules that would require linting `dist/`. Add `pnpm lint` and `pnpm lint:fix` scripts, a `lint` job (or step in the existing job) in `.github/workflows/ci.yml`, and fix or consciously baseline any findings in the existing `src/`, `tests/`, `scripts/` code.

**Acceptance Criteria**

- `pnpm lint` passes on a clean checkout.
- Floating-promise and misused-promise rules are enabled and demonstrably fire (a `//
```

## 4. Existing Claim Activity (2)
- **@Kakarottoooo** (2026-10-15T20:38:54Z): `Hi, I'm interested in this scoped CI task. I checked package.json and the existing Node 20/22 CI: there is currently no lint script or ESLint dependency.  My pr`
- **@fate-lab** (2026-10-15T20:41:58Z): `Hi! I've completed this issue in #34. All acceptance criteria are covered, and lint, typecheck, tests and build pass. Once it's reviewed and merged, how will th`

## 5. Settlement & Claim Header
- Claim Command: `/claim #11`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/13
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`