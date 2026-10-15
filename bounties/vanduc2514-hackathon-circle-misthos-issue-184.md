# Bounty Technical Analysis & Solution — `vanduc2514/hackathon-circle-misthos#184`

- **Target Issue**: [Bounty: remove the simulation — the app runs live, and only live](https://github.com/vanduc2514/hackathon-circle-misthos/issues/184)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T16:58:58.135Z`

## 1. Repository Root Structure (`vanduc2514/hackathon-circle-misthos`)
- `.agents`
- `.editorconfig`
- `.github`
- `.gitignore`
- `.mcp.json`
- `AGENTS.md`
- `CHANGELOG.md`
- `LICENSE`
- `README.md`
- `backend`
- `compose.yaml`
- `contracts`
- `docs`
- `edge`
- `frontend`
- `mise.toml`

## 2. Issue Specification Excerpt
```markdown
## Deliverable

One pull request, merged, that deletes the simulation as a mode. `MISTHOS_SIMULATED` goes,
the simulated escrow goes, the demo endpoints and the stepper go, the seed goes, the demo
wallets go, the edge's simulated wallet service goes, and the test harness stops depending
on a runtime switch that exists to fake the money. Every path in the app then has exactly
one implementation, and it is the live one.

## Context

Simulation is not a corner of this codebase. It is the default, and a second implementation
of the money path, the identity path and the chain path hangs off it:

```mermaid
flowchart TD
    S["Settings.simulated<br/>defaults to True (config.py:17)"]
    S --> C1["build_chain returns SimulatedChain<br/>(services/chain/factory.py:29-31)"]
    S --> C2["the store's own books<br/>(services/chain/simulated.py)"]
    S --> G1["the guards let an anonymous caller write<br/>(api/session.py:41, :66)"]
    S --> G2["37 more reads across backend/src"]
    S --> D1["the demo stepper<br/>/advance, /complete, _demo_only"]
    S --> D2["/demo/issues/{id}/pull-request, /merge, /reset"]
    S --> D3["/auth/github/simulate, /demo/…/subscription/pay"]
    S --> SEED["the se
```

## 3. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 4. Settlement & Claim Header
- Claim Command: `/claim #184`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`