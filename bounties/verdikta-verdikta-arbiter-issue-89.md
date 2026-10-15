# Bounty Technical Analysis, Patch & PR — `verdikta/verdikta-arbiter#89`

- **Target Issue**: [e2e: multi-CID scenarios on main, with a manualOnly flag so the paid bounty-171 replay stays out of the nightly](https://github.com/verdikta/verdikta-arbiter/issues/89)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: Pending fork sync
- **Pull Request**: Ready on branch fix/issue-89
- **Inspected Source File**: `e2e/src/scenario-loader.js`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T20:27:59.742Z`

## 1. Repository Root Structure (`verdikta/verdikta-arbiter`)
- `.gitattributes`
- `.github`
- `.gitignore`
- `.gitleaks.toml`
- `.gitleaksignore`
- `AGENTS.md`
- `LICENSE`
- `README.md`
- `VERDIKTA_DOCS_IMPLEMENTATION.md`
- `ai-node`
- `arbiter-operator`
- `chainlink-node`
- `debug-key-export.sh`
- `docs`
- `e2e`
- `external-adapter`
- `installer`
- `package-lock.json`
- `package.json`
- `testing-tool`

## 2. Inspected Source File (`e2e/src/scenario-loader.js`)
```
'use strict';

const fs = require('fs');
const path = require('path');

const E2E_ROOT = path.join(__dirname, '..');
const DEFAULT_SCENARIOS = path.join(E2E_ROOT, 'scenarios', 'scenarios.json');

const isNonEmptyString = (v) => typeof v === 'string' && v.trim() !== '';

/**
 * Resolve a scenario's evidence CIDs. A scenario declares exactly one of:
 *   - `cid`: a literal CID
 *   - `cidFile`: a path, relative to the e2e root, containing a CID (e.g. one
 *     written by scripts/build-archive.js --pin)
 *   - `cids`: an array of CIDs for a multi-CID request (a bounty sends
 *     [evaluation package, hunter archive])
 * Returns the CID array, or null if a cidFile is declared but not yet present.
 */
function resolveCids(scenario) {
  if (Array.isArray(scenario.cids)) return scenario.cids.map((c) => c.trim());
  if (scenario.cid) return [scenario.cid];
  if (scenario.cidFile) {
    const p = path.resolve(E2E_ROOT, scenario.cidFile);
    if (fs.existsSync(p)) {
      const cid = fs.readFileSync(p, 'utf8').trim();
      return cid ? [cid] : null;
    }
    return null;
  }
  return null;
}

/**
 * The External Adapter's `data.cid` form of a request: CIDs joined by commas,
 * then `:<ad
```

## 3. Issue Specification Excerpt
```markdown
## Goal

The e2e harness on `main` can send a request the way production bounties do (several CIDs plus an addendum), and the bounty-171 replay used to validate #81 lives on `main` as a scenario that runs only when someone names it. The nightly L4 and the L2 job never pay for it.

## Context

Production bounty requests send two CIDs, `[evaluation package, hunter archive]`, with an empty addendum. `main`'s L4 always sends `[scenario.cid]` and an empty addendum, so it cannot reproduce a bounty request.

To validate the oversized-image fix (#81, PR #82), the throwaway branch `claude/canary-bounty-171-replay` (commit 997f424) added:

- `cids` / `addendum` support in `e2e/src/scenario-loader.js` and `e2e/src/l4/run-l4.js`;
- a `bounty-171-replay` scenario (mainnet bounty 171's package and hunter archive).

Two canary runs on class 5555 passed with that branch on 2026-10-15:

- [run 38772484875](https://github.com/verdikta/verdikta-arbiter/actions/runs/38772484875): 1/1 on release fd1b8e8.
- [run 38787664457](https://github.com/verdikta/verdikta-arbiter/actions/runs/38787664457): 3/3 on release d4ff0ec.

The replay's package names a paid jury (gpt-5.6-sol + claude-sonnet-5). The nightly 
```

## 4. Existing Claim Activity (1)
- **@sparkysolutions10-pixel** (2026-10-15T20:19:39Z): `/claim #89  ### 🤖 MiroFish Autonomous Bug Resolution & Proof of Fix  - **Official Pull Request:** [https://github.com/verdikta/verdikta-arbiter/pull/94](https:`

## 5. Settlement & Claim Header
- Claim Command: `/claim #89`
- Pull Request: N/A
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`