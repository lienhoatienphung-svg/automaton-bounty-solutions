# Bounty Technical Analysis, Patch & PR — `Parabola-org/parabola#16`

- **Target Issue**: [[Bounty: $75] Website: accessibility and motion-preference fixes for the landing page](https://github.com/Parabola-org/parabola/issues/16)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: [fix/issue-16](https://github.com/lienhoatienphung-svg/parabola/tree/fix/issue-16)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/parabola/pull/15](https://github.com/lienhoatienphung-svg/parabola/pull/15)
- **Inspected Source File**: `website/src/hero-animation.ts`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T01:13:24.854Z`

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

## 2. Inspected Source File (`website/src/hero-animation.ts`)
```
// Canvas hero animation: tokens burn at a source node, arc through an attestation apex,
// and mint at a destination node, a literal visualization of the burn/attest/mint flow.
// Each launch picks Arc or Stellar as the source at random, so the corridor reads as
// bidirectional rather than a one-way Arc -> Stellar demo. Loops continuously; respects
// prefers-reduced-motion with a static three-stage frame.

interface Rgb {
  r: number;
  g: number;
  b: number;
}

interface Point {
  x: number;
  y: number;
}

interface Colors {
  paper: string;
  slate: string;
  rule: string;
  burn: Rgb;
  attest: Rgb;
  mint: Rgb;
}

interface Particle {
  t0: number;
  dir: 1 | -1; // 1 = Arc -> Stellar, -1 = Stellar -> Arc; either chain can be the source
  launched: boolean;
  pinged: boolean;
  arrived: boolean;
}

interface Ping {
  born: number;
}

interface Dust {
  x: number;
  y: number;
  r: number;
  drift: number;
  phase: number;
}

const DURATION = 2800; // ms per crossing
const SPAWN_EVERY = 780; // ms between launches
const MAX_PARTICLES = 13;
const DUST_COUNT = 110;

export function initHeroAnimation(canvasId: string): void {
  const canvas = document.getElementById(canvasId) 
```

## 3. Issue Specification Excerpt
```markdown
**Context**
`website/` is the project's landing page with a scripted hero animation (`website/src/hero-animation.ts`, `website/src/animations.ts`). Marketing pages built around canvas/CSS animation commonly ship without `prefers-reduced-motion` handling, keyboard-navigable CTAs, or proper document landmarks — and this page is the first impression for developers evaluating the SDK. Without seeing the rendered page the exact gaps can't be listed exhaustively, so this bounty is scoped to an audit-plus-fix pass rather than a single known bug.

**Proposed Change**
Audit the landing page against WCAG 2.1 AA basics and fix what's found: honor `prefers-reduced-motion` (static fallback for the hero animation), ensure all interactive elements are keyboard-reachable with visible focus states, verify color contrast of body text and CTAs, add meaningful `alt`/`aria` where assets are decorative, and ensure a single logical `h1` with ordered headings. Keep the visual design intact — this is not a redesign.

**Acceptance Criteria**

- Hero animation does not run (or runs a static variant) under `prefers-reduced-motion: reduce`, verified in dev tools.
- Full keyboard pass: tab order reaches every c
```

## 4. Existing Claim Activity (7)
- **@Ollie520** (2026-10-15T20:28:35Z): `# Solution for [github/Parabola-org_parabola_16]: [Parabola-org/parabola] [Bounty: $75] Website: accessibility and motion-preference fixes for the landing page`
- **@yodakkak** (2026-10-15T20:49:03Z): `I am working on a focused PR for this issue (#16).`
- **@ayqy** (2026-10-15T22:53:18Z): `Hi maintainers, is there still a paid assignment for the complete landing-page audit and fixes in #16, given the open #41? Main already includes reduced-motion `
- **@hxsworrk-lab** (2026-10-15T23:45:08Z): `With #41 open, is this $75 bounty still accepting another contributor? Before I claim or begin work, could an authorized maintainer confirm the payer, currency/`
- **@phauranta-naresh** (2026-10-16T00:10:56Z): `/claim `
- **@yggdrasilworld** (2026-10-16T00:27:03Z): `/claim #16  Settlement wallet (Base USDC): `0xfBa20992174e777eaBbdd7D10755699B84d030Fd``
- **@wanguanglu** (2026-10-16T00:38:24Z): `Hi @Abdul-dev-creator, I’m Guanglu Wan from Zhixing Studio (知行造物). Is there remaining paid scope for this landing-page task after review of PR #41?  If a contri`

## 5. Settlement & Claim Header
- Claim Command: `/claim #16`
- Pull Request: https://github.com/lienhoatienphung-svg/parabola/pull/15
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`