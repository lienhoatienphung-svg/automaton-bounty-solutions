# Bounty Technical Analysis & Solution — `ditto-assistant/ditto-subnet#2044`

- **Target Issue**: [Specify scoped build-bounty rules, alpha funding and governance](https://github.com/ditto-assistant/ditto-subnet/issues/2044)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T17:21:14.302Z`

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

## 2. Issue Specification Excerpt
```markdown
## Outcome

Publish the program rules, funding and custody contract for scoped build bounties in #2054. The historical 5% maintenance allocation remains a proposal; this issue does not approve a live allocation or an emissions change.

## Agreed v1 rules (2026-10-15)

- Team-defined open-source build tasks; a published bounty revision fixes scope, public interfaces, acceptance evidence, named reviewer, alpha reward pool, entry fee, three-slot limit, and delivery window.
- Three attempts per round; one slot per verified contributor/payee. Each paid claim gets its own deadline (default five days). Submission keeps its slot through review. No automatic renewals or slot recycling; reopening is an audited team action.
- Verified GitHub/hotkey link and applicable CLA required. A chain-owned hotkey is sufficient; SN118 registration is not required.
- Submit an exact commit before the deadline. Later revisions require a recorded reviewer request. Default review target: seven days; reviewer delay cannot cause contributor forfeiture.
- Fees are retained for missed deadlines and unsuccessful submissions. Every contributor receiving an award, including a partial award, receives the full entry 
```

## 3. Existing Claim Activity (1)
- **@Peyton-Spencer** (2026-09-20T14:24:21Z): `Tracked by parent epic #2054.`

## 4. Settlement & Claim Header
- Claim Command: `/claim #2044`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`