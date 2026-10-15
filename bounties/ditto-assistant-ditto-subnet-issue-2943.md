# Bounty Technical Analysis, Patch & PR — `ditto-assistant/ditto-subnet#2943`

- **Target Issue**: [Add bounty operator controls and gate funded activation](https://github.com/ditto-assistant/ditto-subnet/issues/2943)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-2943](https://github.com/lienhoatienphung-svg/ditto-subnet/tree/fix/issue-2943)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/ditto-subnet/pull/1](https://github.com/lienhoatienphung-svg/ditto-subnet/pull/1)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T22:39:03.100Z`

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
> **Implementation consolidated:** the complete v1 implementation is now tracked in [#2942](https://github.com/ditto-assistant/ditto-subnet/issues/2942), which depends on [PR #2889](https://github.com/ditto-assistant/ditto-subnet/pull/2889). This issue preserves detailed reference/coordination notes; do not assign a separate parallel implementation of this scope.

## Outcome

Give maintainers an audited way to operate scoped build bounties while keeping funded actions gated. Parent: #2054. Internal implementation/activation owner: [SN-33](https://omniaura-team.atlassian.net/browse/SN-33).

## Required controls

- Draft and publish revisioned bounty specifications; refuse publication until fee, fixed alpha reward pool, named reviewer, funding configuration, and public build contract are explicit.
- Review queue with exact submissions, claim deadlines, seven-day review targets, overdue flags and reassignment/escalation. Delay by reviewers never forfeits contributor fees.
- Record accept/reject decisions, attribution and shared-award reasons; authorized cancellation, appeal resolution, and explicit reopening of slots. Reviewer-requested rework must have a recorded deadline.
- Pause ne
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #2943`
- Pull Request: https://github.com/lienhoatienphung-svg/ditto-subnet/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`