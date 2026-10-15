# Bounty Technical Analysis & Solution — `zhangjiayang6835-cyber/bounty-plaza#1909`

- **Target Issue**: [[Bounty] [Bounty: $90] Make estimateFee agree with transfer() on maxFee and maxWait fallb](https://github.com/zhangjiayang6835-cyber/bounty-plaza/issues/1909)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T21:58:08.313Z`

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

## 2. Issue Specification Excerpt
```markdown
### 赏金平台 / Platform
GitHub

### 原始链接 / Source URL
https://github.com/Parabola-org/parabola/issues/7

### 漏洞描述 / Description
[Bounty: $90] Make estimateFee agree with transfer() on maxFee and maxWait fallback

**Context**
`transfer()` in `src/transfer.ts:56-71` can silently downgrade a fast transfer to standard when the quoted fee exceeds `options.maxFee` or the fixed 15s fast estimate exceeds `options.maxWait`. `estimateFee` in `src/estimate.ts:15-39` knows nothing about either knob: it always reports fast as available and quotes the current fee. A caller that shows the `estimateFee` result to a user and then calls `transfer()` with `maxFee` set can charge a different mode and fee than quoted — the quote is decorative.

**Proposed Change**
Extend `EstimateFeeParams` with optional `maxFee` and `maxWait`, and implement the same decision logic `transfer()` uses: when the quoted fast fee exceeds `maxFee`, or the fast duration estimate exceeds `maxWait`, return a `standard` estimate. Extract the shared decision into a small pure helper used by both `transfer()` and `estimateFee` so the two cannot drift again.

**Acceptance Criteria**

- `estimateFee` with `maxFee` below the current Iris
```

## 3. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 4. Settlement & Claim Header
- Claim Command: `/claim #1909`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`