# Bounty Technical Analysis, Patch & PR — `ditto-assistant/ditto-subnet#2046`

- **Target Issue**: [Implement bounty acceptance, alpha awards, fee refunds and accounting](https://github.com/ditto-assistant/ditto-subnet/issues/2046)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-2046](https://github.com/lienhoatienphung-svg/ditto-subnet/tree/fix/issue-2046)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/ditto-subnet/pull/8](https://github.com/lienhoatienphung-svg/ditto-subnet/pull/8)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T19:56:10.503Z`

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

Record human acceptance, awards and fee refunds for scoped build bounties, then reconcile manually approved transfers. Team acceptance earns payment; deployment is tracked separately.

## Required behavior

- Record exact submitted commits, claimant and recorded payee, signed bounty revision, acceptance/rejection reasons, and attribution for code and derived ideas.
- Support one winner or shared awards when Ditto combines useful contributions. Sum of awards must not exceed the published fixed alpha reward pool. A partial-award recipient receives the full entry fee back.
- Retain fees for missed deadlines and unsuccessful submissions; record refunds for team cancellation or system faults that prevent a valid claim/submission. Reviewer delay cannot cause forfeiture.
- Create distinct award and fee-refund obligat
```

## 4. Existing Claim Activity (2)
- **@Peyton-Spencer** (2026-09-20T14:24:23Z): `Tracked by parent epic #2054.`
- **@Bobby-Davis8** (2026-09-20T16:17:34Z): `Interested in this one too, though it only makes sense after #2045 lands, since what gets paid depends on what the claim binds.  The parts that sound hardest he`

## 5. Settlement & Claim Header
- Claim Command: `/claim #2046`
- Pull Request: https://github.com/lienhoatienphung-svg/ditto-subnet/pull/8
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`