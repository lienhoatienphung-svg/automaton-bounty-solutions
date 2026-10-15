# Bounty Technical Analysis, Patch & PR — `Ikalus1988/MisakaNet#2757`

- **Target Issue**: [[Bounty] Answer 4 linked question(s) as a lesson](https://github.com/Ikalus1988/MisakaNet/issues/2757)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-2757](https://github.com/lienhoatienphung-svg/MisakaNet/tree/fix/issue-2757)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/MisakaNet/pull/1](https://github.com/lienhoatienphung-svg/MisakaNet/pull/1)
- **Inspected Source File**: `scripts/intake_pipeline.py`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T21:34:40.644Z`

## 1. Repository Root Structure (`Ikalus1988/MisakaNet`)
- `.claude-plugin`
- `.codex-plugin`
- `.codexignore`
- `.cursor`
- `.dockerignore`
- `.gitattributes`
- `.github`
- `.gitignore`
- `.gitleaks.toml`
- `.nojekyll`
- `.pr-agent.toml`
- `.pr-genius.yaml`
- `.pr_agent.toml`
- `.pre-commit-config.yaml`
- `.release-please-manifest.json`
- `AGENTS.md`
- `API.md`
- `ARCHITECTURE.md`
- `CHANGELOG.md`
- `CITATION.cff`
- `CLAUDE.md`
- `CODE_OF_CONDUCT.md`
- `CONTRIBUTING.md`
- `DEPLOYMENT.md`
- `Dockerfile`
- `FAQ.md`
- `GOVERNANCE.md`
- `JOIN.md`
- `LICENSE`
- `Makefile`
- `README.ja.md`
- `README.md`
- `README.zh-CN.md`
- `ROADMAP.md`
- `SECURITY.md`
- `SKILL.md`
- `action.yml`
- `agents`
- `archive`
- `badcase`
- `bench`
- `confidence-judgment`
- `config.example.yaml`
- `config.yaml.example`
- `cordis.patch.yml`
- `data`
- `docs`
- `glama.json`
- `icon.svg`
- `index.d.ts`
- `index.js`
- `integrations`
- `lessons`
- `lib`
- `llms.txt`
- `locale`
- `misaka-protocol.json`
- `misakanet`
- `mkdocs.yml`
- `package-lock.json`
- `package.json`
- `packages`
- `promotional`
- `pyproject.toml`
- `release-please-config.json`
- `requirements-docs.txt`
- `requirements.txt`
- `schemas`
- `scripts`
- `search_knowledge.py`
- `server.json`
- `skills`
- `smithery.yaml`
- `tasks`
- `tests`
- `uv.lock`
- `vscode-extension`
- `workers`
- `wrangler.jsonc`

## 2. Inspected Source File (`scripts/intake_pipeline.py`)
```
#!/usr/bin/env python3
"""
Intake Pipeline (PRD ③) — parse → classify → draft → precheck → persist → notify.

Chains existing MisakaNet intake logic into one idempotent pipeline whose
output lands in D1 (lesson_drafts table) and surfaces a GitHub issue for
maintainer review. Designed to run either standalone (CI / local) or as the
body of a Cloudflare Workflows step.

Usage:
    python3 scripts/intake_pipeline.py --input '{"kind":"missing_lesson","problem":"...","source":"mcp"}' [--dry-run]
    echo '<json>' | python3 scripts/intake_pipeline.py --stdin
    python3 scripts/intake_pipeline.py --json-file intake.json

Auth for D1 + GitHub:
    - D1: CLOUDFLARE_API_TOKEN + CLOUDFLARE_ACCOUNT_ID (CI) or mcporter OAuth
    - GitHub issue: GH_TOKEN env (or GITHUB_TOKEN)

Idempotent: lesson_drafts has UNIQUE(source_id, kind); re-runs skip.
"""
import argparse
import json
import os
import re
import subprocess
import sys
import time
import urllib.request
import urllib.error
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
CF_ACCOUNT = "6b92325b505f2b76aec49e9fe4195d31"
D1_NAME = "misakanet-db"
D1_ID = os.environ.get("MISAKANET_D1_ID", "b9adbe87-6bbf-4d2f-ae56-41c3487b2
```

## 3. Issue Specification Excerpt
```markdown
<!-- misakanet-question-bounty:anchor-2743 -->
# [Bounty] Answer the 4 linked question(s) as a lesson

## Context

These intakes ask about something no lesson covers. Measured through the production retrieval path (BM25 plus the IDF-weighted relevance floor), every one of them returns `no_match` — so there is nothing to link the asker to, and the answer has to be written rather than looked up.

- #2743 — [Question] DSH sidebar surfaces — UI works, but is it functionally worth the code weight? T
- #2751 — [Question] Follow-up to #2750 — sidebar UX friction found walking real user journeys on dsh
- #2752 — [Question] Continuation of #2751 (the 2,000-char truncation in scripts/intake_pipeline.py:2
- #2754 — [Question] Sidebar UX round 3 — voice cue toggle on the panel has NO visual state change. R

_Shared vocabulary that grouped them: `dsh`._

## Deliverable

A lesson under `lessons/` that answers the question(s) above, following `docs/maintainer/lesson-fields.md` (title / domain / problem / root cause / fix, and a `## Verification` that is a checkable command with an expected result). A written answer in the issue is welcome as a first step, but the lesson is what makes it count — i
```

## 4. Existing Claim Activity (1)
- **@adityawaghamare** (2026-10-04T10:54:53Z): `### 🔀 Pull Request Created I have opened a Pull Request with the verified solution patch: [https://github.com/Ikalus1988/MisakaNet/pull/2830](https://github.co`

## 5. Settlement & Claim Header
- Claim Command: `/claim #2757`
- Pull Request: https://github.com/lienhoatienphung-svg/MisakaNet/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`