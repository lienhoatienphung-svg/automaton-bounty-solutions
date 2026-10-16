# Bounty Technical Analysis, Patch & PR — `genfeedai/genfeed.ai#6964`

- **Target Issue**: [Contributor onboarding for the OSS launch](https://github.com/genfeedai/genfeed.ai/issues/6964)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: [fix/issue-6964](https://github.com/lienhoatienphung-svg/genfeed.ai/tree/fix/issue-6964)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/genfeed.ai/pull/1](https://github.com/lienhoatienphung-svg/genfeed.ai/pull/1)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T00:17:04.649Z`

## 1. Repository Root Structure (`genfeedai/genfeed.ai`)
- `.agents`
- `.bun-version`
- `.claude`
- `.coderabbit.yaml`
- `.codex`
- `.cursor`
- `.cursorignore`
- `.dockerignore`
- `.env.example`
- `.gitattributes`
- `.github`
- `.gitignore`
- `.gitleaks.toml`
- `.gitleaksignore`
- `.husky`
- `.jscpd.json`
- `.node-version`
- `.secretlintignore`
- `.secretlintrc.json`
- `.shipcode`
- `.swcrc`
- `.worktreeinclude`
- `AGENTS.md`
- `CCLA.md`
- `CLAUDE.md`
- `CODE_OF_CONDUCT.md`
- `CONTEXT.md`
- `CONTRIBUTING.md`
- `DESIGN.md`
- `GOVERNANCE.md`
- `ICLA.md`
- `LICENSE`
- `LICENSES`
- `README.md`
- `RELEASING.md`
- `SECURITY.md`
- `SUPPORT.md`
- `TRADEMARK.md`
- `apps`
- `biome-staged.json`
- `biome.json`
- `bun.lock`
- `bunfig.toml`
- `cliff.toml`
- `configs`
- `docker`
- `docs`
- `infra`
- `knip.config.ts`
- `lint-staged.config.mjs`
- `lychee.toml`
- `package.json`
- `packages`
- `patches`
- `playwright`
- `portless.json`
- `scripts`
- `skills`
- `tests`
- `tsconfig.json`
- `tsconfig.server.decorators.json`
- `turbo.json`
- `vitest.config.ts`
- `webpack.base.config.js`


## 3. Issue Specification Excerpt
```markdown
Part of #1433. Belongs to the **open-source self-host launch (Phase 1)** and is **not gated on #334**.

The repo already has most contributor plumbing: `CONTRIBUTING.md` (343 lines, with a Portless dev path, PR contract, CLA and label guide), `CODE_OF_CONDUCT.md`, `GOVERNANCE.md`, `SUPPORT.md`, issue forms (`bug.yml`, `feature.yml`, `task.yml` plus `config.yml` routing to Discussions), a PR template, and a README "Contributing" section with the dev commands. This issue covers only the gaps found on 2026-10-14.

## Verified gaps
1. **No issues for newcomers to pick.** The `good first issue` and `help wanted` labels exist, and `CONTRIBUTING.md` (L179–189) and `SUPPORT.md` point contributors to them, but **0 open issues** carry either label (273 open issues).
2. **Most open issues are written for internal agents.** Many reference private QA boxes (e.g. `/workspace/qa-023/...`), the Mac Studio verification host, or `grok-bot`/`codex:automation` lanes, so an outside contributor can't reproduce or verify them.
3. **The community link is easy to miss.** `SUPPORT.md` deliberately says there's no Discord, Slack or forum; GitHub Discussions is the channel. The README only links Discussions i
```

## 4. Existing Claim Activity (3)
- **@Air1N** (2026-10-14T21:03:34Z): `Hi @VincentShipsIt — I can offer a US$125 fixed-price pilot for the first-contribution guide and candidate audit in #6964, if you are funding outside contributo`
- **@VincentShipsIt** (2026-10-14T21:10:00Z): `## Newcomer contributor-path test — Curie, 2026-10-14  **Result: FAIL — the dev app didn't start by following CONTRIBUTING.md alone.** No internal access or key`
- **@pythonyx135793** (2026-10-14T21:17:52Z): `Hi Vincent, I can offer just the docs-only first-contribution quickstart for US$25, if you are funding that separately from the broader onboarding audit. It wou`

## 5. Settlement & Claim Header
- Claim Command: `/claim #6964`
- Pull Request: https://github.com/lienhoatienphung-svg/genfeed.ai/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`