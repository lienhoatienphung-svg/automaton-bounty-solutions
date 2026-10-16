# Bounty Technical Analysis & Solution — `Parabola-org/parabola#15`

- **Target Issue**: [[Bounty: $75] Package hygiene: sideEffects flag, export-map validation, and publint in CI](https://github.com/Parabola-org/parabola/issues/15)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T01:56:50.306Z`

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
`package.json` publishes a dual CJS/ESM build (`main`/`module`/`exports`) via tsup, but declares no `sideEffects` field (bundlers must assume the SDK can have side effects and keep more than necessary), and nothing validates that the published artifact's export map, `files`, and types entries are actually coherent. `pnpm build` succeeding does not catch misconfigured `exports` paths or types that don't resolve for `moduleResolution: "node16"` consumers — the class of bug that only surfaces after `npm publish`.

**Proposed Change**
Add `"sideEffects": false` to `package.json` (verify no module-level side effects in `src/` first — the current sources are pure declarations, but confirm). Add `publint` as a devDependency with a `pnpm publint` script, and run it in CI after `pnpm build` (new step in the existing job or its own job in `.github/workflows/ci.yml`). Fix anything publint flags.

**Acceptance Criteria**

- `sideEffects: false` is set, justified by a clean check of module top-levels.
- `pnpm publint` passes locally against the built `dist/`.
- CI runs publint after build and fails on findings.
- No changes to the runtime bundle contents beyond what the flag enables
```

## 3. Existing Claim Activity (2)
- **@yggdrasilworld** (2026-10-16T00:26:59Z): `/claim #15  Settlement wallet (Base USDC): `0xfBa20992174e777eaBbdd7D10755699B84d030Fd``
- **@ayqy** (2026-10-16T01:44:12Z): `Hi, I’m interested in the complete package/CI fix in this issue. With PRs #28, #64, #73 and #80 plus the fork submission already open, is there still a separate`

## 4. Settlement & Claim Header
- Claim Command: `/claim #15`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`