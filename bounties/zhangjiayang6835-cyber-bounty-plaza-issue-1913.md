# Bounty Technical Analysis, Patch & PR — `zhangjiayang6835-cyber/bounty-plaza#1913`

- **Target Issue**: [[Bounty] [Bounty: $105] Tolerate transient Iris failures in getAttestation and resolveBur](https://github.com/zhangjiayang6835-cyber/bounty-plaza/issues/1913)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-1913](https://github.com/lienhoatienphung-svg/bounty-plaza/tree/fix/issue-1913)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/bounty-plaza/pull/4](https://github.com/lienhoatienphung-svg/bounty-plaza/pull/4)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T22:12:16.050Z`

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
https://github.com/Parabola-org/parabola/issues/3

### 漏洞描述 / Description
[Bounty: $105] Tolerate transient Iris failures in getAttestation and resolveBurn

**Context**
`pollForAttestation` in `src/iris/poll.ts:133-170` tolerates up to 5 consecutive failures before giving up — the right policy against a public API. But `getAttestation` (lines 102-122), used by `resolveBurn` in `src/transfer.ts:285-304`, calls `pollOnce` exactly once and throws `IrisRequestError` on the first failure. So `resolveBurn`, the SDK's read-only "what did this burn commit to?" helper, is strictly less reliable than the polling path for no documented reason. A single dropped connection makes a caller believe the burn is unresolvable.

**Proposed Change**
Give `getAttestation` the same consecutive-failure tolerance as `pollForAttestation` (extract the shared constant and a small retry helper so the policy lives in one place). `getAttestation` should still make exactly one *successful* read — it must not wait for indexing like the poll loop does; only transient failures retry.

**Acceptance Criteria**

- `getAttestation` retries on `IrisRequestError`-class fai
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #1913`
- Pull Request: https://github.com/lienhoatienphung-svg/bounty-plaza/pull/4
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`