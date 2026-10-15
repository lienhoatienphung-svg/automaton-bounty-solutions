# Bounty Technical Analysis, Patch & PR — `WillSmithTE/qdrant-qdrant#320`

- **Target Issue**: [Implement better handling of OOD issues in optimizer](https://github.com/WillSmithTE/qdrant-qdrant/issues/320)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Fork Fix Branch**: [fix/issue-320](https://github.com/lienhoatienphung-svg/qdrant-qdrant/tree/fix/issue-320)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/qdrant-qdrant/pull/1](https://github.com/lienhoatienphung-svg/qdrant-qdrant/pull/1)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T19:19:03.528Z`

## 1. Repository Root Structure (`WillSmithTE/qdrant-qdrant`)
- `.config`
- `.dockerignore`
- `.gitattributes`
- `.github`
- `.gitignore`
- `.rusty-hook.toml`
- `CONTRIBUTING.md`
- `Cargo.lock`
- `Cargo.toml`
- `Dockerfile`
- `LICENSE`
- `README.md`
- `clippy.toml`
- `config`
- `docs`
- `lib`
- `openapi`
- `pkg`
- `rustfmt.toml`
- `shell.nix`
- `src`
- `tests`
- `tools`


## 3. Issue Specification Excerpt
```markdown
**Is your feature request related to a problem? Please describe.**

Currently, if the optimizer is used, it creates a new temporary segment with a copy of data from those segments, which are currently under optimization. 
This process requires sometimes significant amount of disk space and if it is not enough, current implementation might panic.

**Describe the solution you'd like**

In optimization process, we can check if there are enough disk space to continue indexing or not.
A good space to do it is https://github.com/qdrant/qdrant/blob/ccf7f1d24f37dcfe82dad85fa66fb91352bd7a21/lib/collection/src/collection_manager/optimizers/segment_optimizer.rs#L100


**Describe alternatives you've considered**
Indexed segment is potentially a plain structure. There are not too many places where we can't handle the OOD error.
Alternatively, we can check if we can actually handle OOD errors in this case, instead of checking for empty space each time.

**Additional context**

We created a test that simulates the scenario of disk overflow https://github.com/qdrant/qdrant/pull/4267

The solution for this issue should resolve this test scenario in the most general way reasonable
```

## 4. Existing Claim Activity (10)
- **@WillSmithTE** (2026-06-17T07:05:57Z): `**generall** commented on 2024-05-22T11:57:22Z:  ---  /bounty $200  <!-- upstream-comment: qdrant/qdrant#4297-2124613717 -->`
- **@WillSmithTE** (2026-06-17T07:05:59Z): `**algora-pbc[bot]** commented on 2024-05-22T11:57:27Z:  ---  ## 💎 $200 bounty [• Qdrant](https://algora.io/Qdrant) ### Steps to solve: 1. **Start working**: Co`
- **@WillSmithTE** (2026-06-17T07:06:00Z): `**varshith257** commented on 2024-05-23T03:14:59Z:  ---  /attempt #4297   <div id="algora-attempt" />  | [Algora profile](https://console.algora.io/@/varshi`
- **@WillSmithTE** (2026-06-17T07:06:02Z): `**Anshgrover23** commented on 2024-06-14T14:09:23Z:  ---  /attempt #4297  <div id="algora-attempt" />  <details>   <summary>Options</summary>   <ul>     <li>   `
- **@WillSmithTE** (2026-06-17T07:06:03Z): `**devdairy699** commented on 2024-06-27T02:02:59Z:  ---  /attempt #4297  <div id="algora-attempt" />  <details>   <summary>Options</summary>   <ul>     <li>    `
- **@WillSmithTE** (2026-06-17T07:06:06Z): `**xhjkl** commented on 2024-06-27T15:05:44Z:  ---  /attempt #4297  <div id="algora-attempt" />  <details>   <summary>Options</summary>   <ul>     <li>       <a `
- **@WillSmithTE** (2026-06-17T07:06:07Z): `**algora-pbc[bot]** commented on 2024-06-27T15:23:08Z:  ---  💡 @ xhjkl submitted a [pull request](https://github.com/qdrant/qdrant/pull/4578) that claims the b`
- **@WillSmithTE** (2026-06-17T07:06:09Z): `**algora-pbc[bot]** commented on 2024-06-29T10:57:33Z:  ---  @ xhjkl: You've been awarded a **$220** bounty by **Qdrant**! 👉 [Complete your Algora onboarding](`
- **@WillSmithTE** (2026-06-17T07:06:10Z): `**varshith257** commented on 2024-07-02T03:03:24Z:  ---  @ generall Is this issue to be closed? OR any work left off with it?  <!-- upstream-comment: qdrant/qdr`
- **@WillSmithTE** (2026-06-17T07:06:14Z): `**algora-pbc[bot]** commented on 2024-07-02T06:37:20Z:  ---  🎉🎈 @ xhjkl has been awarded **$220**! 🎈🎊  - [Share on socials](https://console.algora.io/awards`

## 5. Settlement & Claim Header
- Claim Command: `/claim #320`
- Pull Request: https://github.com/lienhoatienphung-svg/qdrant-qdrant/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`