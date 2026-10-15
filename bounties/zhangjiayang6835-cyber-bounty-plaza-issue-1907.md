# Bounty Technical Analysis, Patch & PR — `zhangjiayang6835-cyber/bounty-plaza#1907`

- **Target Issue**: [[Bounty] [Bounty: $90] Reject unsupported CCTP message versions in decodeCctpMessage](https://github.com/zhangjiayang6835-cyber/bounty-plaza/issues/1907)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-1907](https://github.com/lienhoatienphung-svg/bounty-plaza/tree/fix/issue-1907)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/bounty-plaza/pull/10](https://github.com/lienhoatienphung-svg/bounty-plaza/pull/10)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T22:01:08.789Z`

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
https://github.com/Parabola-org/parabola/issues/9

### 漏洞描述 / Description
[Bounty: $90] Reject unsupported CCTP message versions in decodeCctpMessage

**Context**
`decodeCctpMessage` in `src/utils/message.ts:88-121` validates only minimum length, then reads every header and body field at hard-coded V2 offsets (lines 14-36, cross-checked against Circle's reference contracts). It never checks the `version` header field or `burnBodyVersion`. If Circle ships a V3 message format with different field layout, or a non-burn body ever reaches this decoder, the function returns a confidently wrong decode — wrong amount, wrong recipient — and `completeMint` / `resolveBurn` would act on it. For a function whose output decides where funds get minted, silent misreads are the worst failure mode.

**Proposed Change**
After the length check, read `version` and `burnBodyVersion` and throw a descriptive error when either is unsupported (accept exactly the versions this SDK decodes today: header version 2, burn body version 2 — verify the exact expected values against `src/utils/message.ts` comments and Circle's contracts before hard-coding). The error
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #1907`
- Pull Request: https://github.com/lienhoatienphung-svg/bounty-plaza/pull/10
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`