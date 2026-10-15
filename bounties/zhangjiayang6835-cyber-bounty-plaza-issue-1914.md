# Bounty Technical Analysis, Patch & PR — `zhangjiayang6835-cyber/bounty-plaza#1914`

- **Target Issue**: [[Bounty] [Bounty: $105] Stop silently pricing Fast Transfers at zero when Iris returns no](https://github.com/zhangjiayang6835-cyber/bounty-plaza/issues/1914)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: DeepPulse Unindexed API & Algora PR Bounty Harvester
- **Fork Fix Branch**: [fix/issue-1914](https://github.com/lienhoatienphung-svg/bounty-plaza/tree/fix/issue-1914)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/bounty-plaza/pull/5](https://github.com/lienhoatienphung-svg/bounty-plaza/pull/5)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T22:02:54.595Z`

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
https://github.com/Parabola-org/parabola/issues/2

### 漏洞描述 / Description
[Bounty: $105] Stop silently pricing Fast Transfers at zero when Iris returns no fast tier

**Context**
`fetchFastTransferFeeBps` in `src/iris/poll.ts:10-23` does `body.find((entry) => entry.finalityThreshold <= 1000)` and falls back to `return fastEntry?.minimumFee ?? 0`. If Iris changes its response shape, returns an empty array, or ships a tier with a different threshold, every fast transfer is silently quoted a zero fee — in `transfer()` this flows into `feeRaw = 0` and a `TransferResult.fee` of `"0"`, and in `estimateFee` it produces a free-looking quote. The same function also throws a bare `Error` on HTTP failure (line 18) even though `IrisRequestError` exists specifically for this service and carries the status code.

**Proposed Change**
Throw `IrisRequestError` (with status) on non-OK responses. When no fast-tier entry is found in a successful response, throw a descriptive error instead of returning 0 — an unpriced fee is a failure, not a free transfer. Keep returning `minimumFee` for the normal case unchanged.

**Acceptance Criteria**

- Non-OK Iris 
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #1914`
- Pull Request: https://github.com/lienhoatienphung-svg/bounty-plaza/pull/5
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`