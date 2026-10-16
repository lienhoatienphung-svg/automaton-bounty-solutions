# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#18`

- **Target Issue**: [[Bounty: $60] Harden scripts/testnet-smoke.mjs with retries, exit codes, and a step summary](https://github.com/Parabola-org/parabola/issues/18)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-18](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-18)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/16](https://github.com/lienhoatienphung-svg/parabola/pull/16)
- **Inspected Source File**: `.github/workflows/ci.yml`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T01:17:43.489Z`

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
`scripts/testnet-smoke.mjs` is the end-to-end testnet check (`pnpm smoke`) and one of the few signals that the SDK works against live Circle Iris and real contracts. Public testnets and faucets flake constantly — transient RPC 5xx, attestation delays just over the poll window, faucet rate limits. A smoke script with no retry or step-level reporting turns every flake into a false alarm, and a script that doesn't exit non-zero on partial failure turns real breakage into a green-looking run.

**Proposed Change**
Restructure the script into named steps (fund/check, approve+burn, attestation wait, mint) with per-step retry + exponential backoff for infrastructure-shaped failures only (not for deterministic validation failures). Exit non-zero if any step ultimately fails, print a per-step pass/fail/duration summary at the end, and keep the burn hash printed prominently on post-burn failure so a human can recover the run with `completeMint`. No new dependencies — plain Node.

**Acceptance Criteria**

- Each step retries transient failures with backoff; deterministic failures (bad address, insufficient funds) fail immediately without retry.
- Final summary lists every step with
```

## 4. Existing Claim Activity (3)
- **@yodakkak** (2026-10-15T20:49:06Z): `I am working on a focused PR for this issue (#18).`
- **@yggdrasilworld** (2026-10-16T00:11:42Z): `/claim #18  Settlement wallet (Base USDC): `0xfBa20992174e777eaBbdd7D10755699B84d030Fd``
- **@ayqy** (2026-10-16T00:44:38Z): `Hi maintainers, is the complete #18 change still available as paid work after PRs #40 and #72? I also saw the linked fork PR, so I’d like to confirm what remain`

## 5. Settlement & Claim Header
- Claim Command: `/claim #18`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/16
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`