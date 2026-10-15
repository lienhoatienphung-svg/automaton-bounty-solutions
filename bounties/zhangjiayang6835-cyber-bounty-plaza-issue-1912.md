# Bounty Technical Analysis, Patch & PR — `zhangjiayang6835-cyber/bounty-plaza#1912`

- **Target Issue**: [[Bounty] [Bounty: $105] checkStellarRecipientReady must not report RPC outages as missing](https://github.com/zhangjiayang6835-cyber/bounty-plaza/issues/1912)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-1912](https://github.com/lienhoatienphung-svg/bounty-plaza/tree/fix/issue-1912)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/bounty-plaza/pull/6](https://github.com/lienhoatienphung-svg/bounty-plaza/pull/6)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T21:59:22.410Z`

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
https://github.com/Parabola-org/parabola/issues/4

### 漏洞描述 / Description
[Bounty: $105] checkStellarRecipientReady must not report RPC outages as missing accounts

**Context**
`checkStellarRecipientReady` in `src/chains/stellar.ts:144-177` wraps `server.getAccount(recipient)` in a bare `catch` that returns `{ exists: false, hasTrustline: false, ready: false }`. Any failure — DNS error, RPC 503, rate limit on the public mainnet endpoint (which `src/constants.ts:49-52` explicitly warns is rate-limited) — is indistinguishable from an account that genuinely was never funded. `assertStellarRecipientReady` in `src/transfer.ts:207-223` then throws "recipient does not exist yet. It must be funded with at least the minimum XLM reserve", sending the caller down the wrong remediation path for what is actually an infrastructure problem.

**Proposed Change**
Inspect the error from `getAccount` and only map the Stellar SDK's account-not-found condition to `exists: false`. Anything else (transport errors, 5xx responses) should propagate as `IrisRequestError`-style infrastructure failure — or a new small error type if that fits better — so callers
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #1912`
- Pull Request: https://github.com/lienhoatienphung-svg/bounty-plaza/pull/6
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`