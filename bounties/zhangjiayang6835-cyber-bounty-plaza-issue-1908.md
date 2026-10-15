# Bounty Technical Analysis, Patch & PR — `zhangjiayang6835-cyber/bounty-plaza#1908`

- **Target Issue**: [[Bounty] [Bounty: $90] Skip the Arc approve transaction when the existing allowance alrea](https://github.com/zhangjiayang6835-cyber/bounty-plaza/issues/1908)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: DeepPulse Unindexed API & Algora PR Bounty Harvester
- **Fork Fix Branch**: [fix/issue-1908](https://github.com/lienhoatienphung-svg/bounty-plaza/tree/fix/issue-1908)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/bounty-plaza/pull/7](https://github.com/lienhoatienphung-svg/bounty-plaza/pull/7)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T21:58:38.753Z`

## 1. Repository Root Structure (`zhangjiayang6835-cyber/bounty-plaza`)
- `.env.example`
- `.github`
- `.gitignore`
- `AUTOMATION_GUIDE.md`
- `BOUNTY_CONFIG.json`
- `LEADERBOARD.md`
- `README.en.md`
- `README.md`
- `REWARD_POLICY.en.md`
- `REWARD_POLICY.md`
- `RULES.en.md`
- `RULES.md`
- `data`
- `docker-compose.yml`
- `docs`
- `scripts`
- `web`


## 3. Issue Specification Excerpt
```markdown
### 赏金平台 / Platform
GitHub

### 原始链接 / Source URL
https://github.com/Parabola-org/parabola/issues/8

### 漏洞描述 / Description
[Bounty: $90] Skip the Arc approve transaction when the existing allowance already covers the burn

**Context**
`burn()` in `src/transfer.ts:153-179` calls `approveUsdcOnArc` unconditionally before every Arc-sourced burn, submitting an exact-amount ERC-20 approve even when TokenMessengerV2 already has an allowance ≥ `amountRaw` from a prior transfer. That's an extra transaction, extra Arc gas, and an extra confirmation wait on every transfer from the same hot wallet — a real cost for any service running frequent transfers. The exact-amount approval policy (comment at lines 160-163) is good for minimizing standing allowance, but reading the current allowance first is free relative to submitting a write.

**Proposed Change**
Before approving, read the current USDC allowance (`allowance(owner, tokenMessengerV2)`) through the existing `publicClient` in `src/chains/arc.ts`. If it already covers `amountRaw`, skip the approve transaction entirely. If it doesn't, keep today's exact-amount approve. Do not increase or "top up" an existing partial allowance — replace it 
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #1908`
- Pull Request: https://github.com/lienhoatienphung-svg/bounty-plaza/pull/7
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`