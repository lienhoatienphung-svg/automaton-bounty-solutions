# Bounty Technical Analysis, Patch & PR — `ditto-assistant/ditto-subnet#2054`

- **Target Issue**: [Epic: SN118 scoped build bounties: paid slots, human review, and alpha awards](https://github.com/ditto-assistant/ditto-subnet/issues/2054)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-2054](https://github.com/lienhoatienphung-svg/ditto-subnet/tree/fix/issue-2054)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/ditto-subnet/pull/7](https://github.com/lienhoatienphung-svg/ditto-subnet/pull/7)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T17:16:04.226Z`

## 1. Repository Root Structure (`ditto-assistant/ditto-subnet`)
- `.agents`
- `.claude`
- `.codex`
- `.depot`
- `.dockerignore`
- `.env.example`
- `.github`
- `.gitignore`
- `.impeccable`
- `AGENTS.md`
- `CHANGELOG.md`
- `CLAUDE.md`
- `Dockerfile`
- `Dockerfile.pylon`
- `Dockerfile.sandbox-docker`
- `Dockerfile.screener-fleet-release`
- `Dockerfile.stack-release`
- `LICENSE`
- `Makefile`
- `README.md`
- `apps`
- `ditto`
- `docker-compose.yml`
- `docs`
- `infra`
- `localstack`
- `miners`
- `packages`
- `preview`
- `pyproject.toml`
- `release`
- `research`
- `scripts`
- `services`
- `tests`
- `uv.lock`
- `workers`


## 3. Issue Specification Excerpt
```markdown
## Outcome

Let Ditto publish specific open-source build tasks, accept three paid attempts per round, review submissions, and award contributors whose work or ideas it chooses to use. This extends the existing maintenance-bounty program to useful product modules and integrations.

The approved 2026-10-15 design is the first-release target. These issues track implementation and evaluation; publishing the backlog does not mean the software is implemented or funded.

## Agreed v1 rules (2026-10-15)

- Team-defined open-source build tasks; a published bounty revision fixes scope, public interfaces, acceptance evidence, named reviewer, alpha reward pool, entry fee, three-slot limit, and delivery window.
- Three attempts per round; one slot per verified contributor/payee. Each paid claim gets its own deadline (default five days). Submission keeps its slot through review. No automatic renewals or slot recycling; reopening is an audited team action.
- Verified GitHub/hotkey link and applicable CLA required. A chain-owned hotkey is sufficient; SN118 registration is not required.
- Submit an exact commit before the deadline. Later revisions require a recorded reviewer request. Default review
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #2054`
- Pull Request: https://github.com/lienhoatienphung-svg/ditto-subnet/pull/7
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`