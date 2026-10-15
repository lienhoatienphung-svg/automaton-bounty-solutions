# Bounty Technical Analysis, Patch & PR — `claude-builders-bounty/claude-builders-bounty#3`

- **Target Issue**: [[BOUNTY $100] HOOK: Pre-tool-use hook that blocks destructive bash commands](https://github.com/claude-builders-bounty/claude-builders-bounty/issues/3)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: [fix/issue-3](https://github.com/lienhoatienphung-svg/claude-builders-bounty/tree/fix/issue-3)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/claude-builders-bounty/pull/3](https://github.com/lienhoatienphung-svg/claude-builders-bounty/pull/3)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T22:05:38.388Z`

## 1. Repository Root Structure (`claude-builders-bounty/claude-builders-bounty`)
- `LICENSE`
- `README.md`


## 3. Issue Specification Excerpt
```markdown
## 💰 Bounty: $100 — powered by [Opire](https://opire.dev)

## Description
Create a Claude Code `pre-tool-use` hook in Python or bash that intercepts
dangerous bash commands before they are executed.

## Acceptance Criteria
- [ ] Hook follows Claude Code hooks format (`~/.claude/hooks/`)
- [ ] Blocks these patterns: `rm -rf`, `DROP TABLE`, `git push --force`,
      `TRUNCATE`, `DELETE FROM` without a WHERE clause
- [ ] Logs every blocked attempt to `~/.claude/hooks/blocked.log`
      with: timestamp, attempted command, project path
- [ ] Displays a clear message to Claude explaining why the command was blocked
- [ ] Does not interfere with normal bash commands
- [ ] README with installation in 2 commands or fewer

## How to Claim
1. Comment `/opire try` in this issue
2. Submit a PR with the hook + README
3. Payment is released automatically on merge ✅

## Resources
- Claude Code hooks docs: https://docs.anthropic.com/claude-code/hooks
```

## 4. Existing Claim Activity (1)
- **@DrGalio** (2026-03-27T01:05:58Z): `Claiming this bounty! 🛡️  PR submitted: https://github.com/claude-builders-bounty/claude-builders-bounty/pull/6  The hook: - Blocks rm -rf, DROP TABLE, git pus`

## 5. Settlement & Claim Header
- Claim Command: `/claim #3`
- Pull Request: https://github.com/lienhoatienphung-svg/claude-builders-bounty/pull/3
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`