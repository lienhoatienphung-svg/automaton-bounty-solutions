# Bounty Technical Analysis & Solution — `ubiquity-os-marketplace/text-vector-embeddings#111`

- **Target Issue**: [Nomic Embeddings Model for +10% Accuracy](https://github.com/ubiquity-os-marketplace/text-vector-embeddings/issues/111)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated QA, Security Audit & DevOps Suite: GitHub Bounty  Web3 Wallet Manageme
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T10:25:14.397Z`

## 1. Repository Root Structure (`ubiquity-os-marketplace/text-vector-embeddings`)
- `.cspell.json`
- `.dev.vars.example`
- `.env.example`
- `.gitattributes`
- `.github`
- `.gitignore`
- `.husky`
- `.nvmrc`
- `.prettierignore`
- `.prettierrc`
- `.yarnrc.yml`
- `CHANGELOG.md`
- `README.md`
- `bun.lock`
- `docs`
- `eslint.config.mjs`
- `graphql.config.yml`
- `package.json`
- `scripts`
- `src`
- `supabase`
- `tests`
- `tsconfig.json`
- `wrangler.toml`

## 2. Issue Specification Excerpt
```markdown
The vector embedding model that we use is slightly outdated. I did some research to see what has higher accuracy, and I found one with 10% increased accuracy. We should make use of it as well as our old model.

## Leaderboard

Model | Top-5 Retrieval Accuracy (%) | Notes
-- | -- | --
Nomic Embed v1.5 | ~86.2% | Highest overall retrieval accuracy in semantic search benchmarks, especially strong on short & direct queries. Open source and highly accurate.
Voyage-3-large | ~75-77% | Best model from Voyage AI, state-of-the-art in industry, notably outperforms OpenAI text-embedding-3-large by ~9.7%. Strong on domain-specific tasks.

## Tradeoff

> When you submit a GitHub comment that exceeds the token capacity of the embedding model, typically:
> - The model will truncate the input at its token limit (e.g., 8,192 tokens for Nomic or 32,000 tokens for Voyage).
> - This means any text beyond the max token limit is ignored, which can lead to loss of context and reduced embedding quality if important content is cut off.

## Solution

> 2. Similarity Functions
> - Key Point: Embeddings from different models generally cannot be directly compared using the same similarity function (e.g., cosin
```

## 3. Existing Claim Activity (3)
- **@ubiquity-os-beta[bot]** (2025-08-24T07:51:19Z): `>[!NOTE] >The following contributors may be suitable for this task: >### [shiv810](https://www.github.com/shiv810) > `74% Match` [ubiquity/work.ubq.fi#119](http`
- **@ubiquity-os-beta[bot]** (2025-08-24T07:51:19Z): `>[!NOTE] >The following contributors may be suitable for this task: >### [shiv810](https://www.github.com/shiv810) > `72% Match` [ubiquity/work.ubq.fi#119](http`
- **@ubiquity-os-beta[bot]** (2025-08-24T07:51:19Z): `>[!NOTE] >The following contributors may be suitable for this task: >### [shiv810](https://www.github.com/shiv810) > `72% Match` [ubiquity/work.ubq.fi#119](http`

## 4. Settlement & Claim Header
- Claim Command: `/claim #111`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`