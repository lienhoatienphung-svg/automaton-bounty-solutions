# Bounty Technical Analysis & Solution — `ditto-assistant/ditto-subnet#2871`

- **Target Issue**: [Miner CLI: attest a GitHub account and link it to the miner hotkey](https://github.com/ditto-assistant/ditto-subnet/issues/2871)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: DeepPulse Unindexed API & Algora PR Bounty Harvester
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T18:40:21.690Z`

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
## Goal

Let a miner prove, from the `uv run ditto` CLI, that they control a GitHub account, and record a verified link between that account and their miner hotkey. Bounties need it: a claim in [docs/bounty-claims.md](https://github.com/ditto-assistant/ditto-subnet/blob/main/docs/bounty-claims.md) currently signs a self-asserted `github_login`, so nothing stops a claimant from naming someone else's account. With a verified link, reviewers can match PRs to claimants and trust the match.

The link is identity only. It never changes where money goes. Bounty-claims principle 1 still holds: **the hotkey decides who you are, and GitHub is only a label.** The payee stays the coldkey signed into the claim.

## Proposed design

This follows `ditto link-ditto` ([`ditto/miner_cli/commands/link_ditto.py`](https://github.com/ditto-assistant/ditto-subnet/blob/main/ditto/miner_cli/commands/link_ditto.py), [`apps/platform/ditto/api_server/endpoints/miner_ditto_link.py`](https://github.com/ditto-assistant/ditto-subnet/blob/main/apps/platform/ditto/api_server/endpoints/miner_ditto_link.py)), which already proves a hotkey and an external account in one round trip:

1. `ditto login` creates the miner 
```

## 3. Existing Claim Activity (2)
- **@planners1490** (2026-10-13T18:56:21Z): `I'd like to take **#2871** next (since #2872's PR check stretch goal builds on this hotkey ↔ GitHub link).  ### Answers to Open Questions & Proposed Architectur`
- **@planners1490** (2026-10-13T18:57:56Z): `I have now submitted the full implementation PR for **#2871** as well: https://github.com/ditto-assistant/ditto-subnet/pull/2880  - **Alembic migration**: `mine`

## 4. Settlement & Claim Header
- Claim Command: `/claim #2871`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`