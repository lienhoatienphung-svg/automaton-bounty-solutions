# Bounty Technical Analysis, Patch & PR — `claude-builders-bounty/claude-builders-bounty#5`

- **Target Issue**: [[BOUNTY $200] WORKFLOW: n8n + Claude Code — automated weekly dev summary](https://github.com/claude-builders-bounty/claude-builders-bounty/issues/5)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: [fix/issue-5](https://github.com/lienhoatienphung-svg/claude-builders-bounty/tree/fix/issue-5)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/claude-builders-bounty/pull/2](https://github.com/lienhoatienphung-svg/claude-builders-bounty/pull/2)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T22:15:56.337Z`

## 1. Repository Root Structure (`claude-builders-bounty/claude-builders-bounty`)
- `LICENSE`
- `README.md`


## 3. Issue Specification Excerpt
```markdown
## 💰 Bounty: $200 — powered by [Opire](https://opire.dev)

## Description
Create a complete n8n workflow that automatically generates a weekly narrative
summary of a GitHub repo's activity, using the Claude API.

## Acceptance Criteria
- [ ] Exportable n8n workflow (importable `.json` file)
- [ ] Trigger: weekly cron (e.g., Friday at 5pm)
- [ ] Fetches from GitHub API: commits, closed issues, merged PRs for the week
- [ ] Calls Claude API (`claude-sonnet-4-20250514`) to generate a narrative summary
- [ ] Delivers the summary via: email OR Discord/Slack webhook (your choice, documented)
- [ ] Configurable variables: GitHub repo, destination channel, language (EN/FR)
- [ ] Tested on a real n8n instance (include a screenshot of successful execution)
- [ ] README with setup instructions in 5 steps or fewer

## How to Claim
1. Comment `/opire try` in this issue
2. Submit a PR with the `.json` workflow + README
3. Payment is released automatically on merge ✅

## Resources
- n8n docs: https://docs.n8n.io
- Claude API docs: https://docs.anthropic.com
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #5`
- Pull Request: https://github.com/lienhoatienphung-svg/claude-builders-bounty/pull/2
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`