# Bounty Technical Analysis, Patch & PR — `ditto-assistant/ditto-subnet#2942`

- **Target Issue**: [Implement the scoped build-bounty system on top of miner identity and CLA](https://github.com/ditto-assistant/ditto-subnet/issues/2942)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Fork Fix Branch**: [fix/issue-2942](https://github.com/lienhoatienphung-svg/ditto-subnet/tree/fix/issue-2942)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/ditto-subnet/pull/4](https://github.com/lienhoatienphung-svg/ditto-subnet/pull/4)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T19:54:19.826Z`

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
**Depends on [PR #2889 — verified GitHub links and signed CLA consent](https://github.com/ditto-assistant/ditto-subnet/pull/2889).** Build on its identity/consent interfaces; while it is open, stack the implementation on its current branch/head and rebase onto main when it lands. Re-read its head before starting. Do not rebuild GitHub OAuth, hotkey linking or CLA signing.

Suggested implementation owner: Diana (`double-k-3033`), who owns the prerequisite. This issue is ready for assignment; no contributor commitment is assumed.

## Deliverable

One complete build-bounty workflow: publish a bounty on DittoBench, claim a paid slot, submit exact work, review it, record awards/refunds, and track manually approved alpha settlement. Platform is authoritative; GitHub supplies the public work specification. Deliver this under one issue; use a small PR stack if useful.

## Rules

- A published, signed revision fixes scope, public interfaces, acceptance evidence, named reviewer, alpha entry fee, fixed alpha reward pool and delivery duration.
- Three attempts per round; one slot per verified contributor/payee. Require the verified GitHub/hotkey link and applicable CLA from #2889. A chain-owne
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #2942`
- Pull Request: https://github.com/lienhoatienphung-svg/ditto-subnet/pull/4
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`