# Bounty Technical Analysis, Patch & PR — `Expensify/App#98426`

- **Target Issue**: [[Due for payment 2026-10-14] [$250] DEV: Rate not valid error is displayed when submitting a distance expense, but the Rate field is not editable](https://github.com/Expensify/App/issues/98426)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-98426](https://github.com/lienhoatienphung-svg/App/tree/fix/issue-98426)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/App/pull/1](https://github.com/lienhoatienphung-svg/App/pull/1)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T22:29:10.178Z`

## 1. Repository Root Structure (`Expensify/App`)
- `.buckconfig`
- `.bun-version`
- `.bundle`
- `.claude`
- `.env.example`
- `.env.production`
- `.env.staging`
- `.gitattributes`
- `.github`
- `.gitignore`
- `.gitmodules`
- `.imgbotconfig`
- `.java-version`
- `.mcp.json`
- `.npmrc`
- `.nvmrc`
- `.oxfmtrc.json`
- `.ruby-version`
- `.storybook`
- `.watchmanconfig`
- `.well-known`
- `AGENTS.md`
- `CLA.md`
- `CLAUDE.md`
- `CODE_OF_CONDUCT.md`
- `Cloudflare_CA.crt`
- `Gemfile`
- `Gemfile.lock`
- `LICENSE.md`
- `Mobile-Expensify`
- `PR_REVIEW_GUIDELINES.md`
- `README.md`
- `__mocks__`
- `android`
- `assets`
- `babel.config.js`
- `bunfig.toml`
- `codecov.yml`
- `colors.json`
- `config`
- `contributingGuides`
- `cspell.json`
- `docs`
- `eslint-plugin-local-rules`
- `eslint.config.mjs`
- `evals`
- `fastlane`
- `index.js`
- `ios`
- `jest.config.js`
- `jest`
- `knip.json`
- `lefthook.yml`
- `metro.config.js`
- `modules`
- `package-lock.json`
- `package.json`
- `patches`
- `prompts`
- `react-native.config.js`
- `rock.config.mjs`
- `rspack.config.mjs`
- `scripts`
- `server`
- `src`
- `tests`
- `tsconfig.app.json`
- `tsconfig.base.json`
- `tsconfig.bun.json`
- `tsconfig.jest.json`
- `tsconfig.json`
- `tsconfig.node.json`
- `vendor`
- `wdyr.ts`
- `web`


## 3. Issue Specification Excerpt
```markdown
If you haven’t already, check out our [contributing guidelines](https://github.com/Expensify/ReactNativeChat/blob/main/contributingGuides/CONTRIBUTING.md) for onboarding. To join our Slack channel, fill out [this form](https://forms.gle/Q7hnhUJPnQCK7Fe56).
___

**Version Number:**
**Reproducible in staging?:** Needs Reproduction (Unable to reproduce)
**Reproducible in production?:** Needs Reproduction
**If this was caught during regression testing, add the test name, ID and link from BrowserStack:**
**Email or phone of affected tester (no customers):**
**Logs:** https://stackoverflow.com/c/expensify/questions/4856
**Expensify/Expensify Issue URL:**
**Issue reported by:** @FitseTLT 
**Slack conversation** (hyperlinked to channel name): [#Expensify Bugs](https://expensify.slack.com/archives/C049HHMV9SM/p1786539633985959)
 
## Action Performed:

1. Create a Track Distance expense in Self DM.
2. Click Submit to a friend and choose a workspace.
3. Observe the Rate not valid error.
4. Try to edit the Rate field.

## Expected Result:
The Rate field should contain a valid rate before submission.
If the rate is invalid, the user should be able to edit it and correct the value.
The expense s
```

## 4. Existing Claim Activity (1)
- **@MelvinBot** (2026-08-12T13:55:19Z): `## Proposal  ### What is the root cause of that problem?  Both symptoms trace back to one thing: the **P2P sentinel rate `_FAKE_P2P_ID_` survives** when a Self-`

## 5. Settlement & Claim Header
- Claim Command: `/claim #98426`
- Pull Request: https://github.com/lienhoatienphung-svg/App/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`