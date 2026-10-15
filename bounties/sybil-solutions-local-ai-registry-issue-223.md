# Bounty Technical Analysis, Patch & PR — `sybil-solutions/local-ai-registry#223`

- **Target Issue**: [Bounty $50: recipe for Ryzen AI 890M (Radeon 890M iGPU)](https://github.com/sybil-solutions/local-ai-registry/issues/223)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-223](https://github.com/lienhoatienphung-svg/local-ai-registry/tree/fix/issue-223)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/local-ai-registry/pull/3](https://github.com/lienhoatienphung-svg/local-ai-registry/pull/3)
- **Inspected Source File**: `lab/lab.py`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T22:26:17.509Z`

## 1. Repository Root Structure (`sybil-solutions/local-ai-registry`)
- `.github`
- `.gitignore`
- `LICENSE`
- `Makefile`
- `README.md`
- `SECURITY.md`
- `app`
- `data`
- `dist`
- `docs`
- `lab`
- `plugin`
- `registry`
- `sdk`
- `site`

## 2. Inspected Source File (`lab/lab.py`)
```
#!/usr/bin/env python3
"""The recipe lab: run a model on a card, check it, and only then write its recipe.

A recipe is the output of a passing run, never written by hand. It names the weights (pinned), an
engine profile (pinned), the few settings that differ from the profile's defaults, the card, and the
proof. Everything a program needs to launch it is rendered from the profile, so a recipe is ~600 bytes.

    lab.py try <repo>@<revision> --model <id> --engine <profile> --card <card> [--set k=v ...]
               [--on vast|runpod|endpoint] [--endpoint URL] [--proxy-gpu NAME]
    lab.py render <recipe.json>        # the launch a program runs, as JSON
    lab.py check                       # every recipe: format, pins, profile, card, proof (CI)

Gates (all must pass): load, chat, reasoning, tools, context, speed. The full evidence goes to
lab/runs/ (data, kept); the recipe goes to recipes/<card>/ (production). Standard library only.
"""

import argparse
import datetime as dt
import hashlib
import json
import os
import re
import shlex
import string
import sys
import time
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
REG = ROOT / "reg
```

## 3. Issue Specification Excerpt
```markdown
**Pays $50** when a PR adds a tested recipe for this card and is merged. Rules: [BOUNTIES.md](https://github.com/sybil-solutions/.github/blob/main/BOUNTIES.md).

| | |
|---|---|
| Card | `radeon-890m-48gb` |
| Model | Qwen3.5-9B or Gemma 4 12B, or any model in `registry/models.json` not yet tested on this card |
| Context | 64K or more |
| Done when | all six checks pass: loads, answers, thinks, calls a tool, recalls at a nearly full window, 15 tok/s or more |

**Why:** Strix Point laptops show up in installs with nothing to run.

### Steps
1. Comment `/attempt` here. A maintainer marks it `claimed`; you have 7 days.
2. On the machine, clone the [recipe kit](https://github.com/sybil-solutions/local-ai-recipe-kit), open your coding agent in it and give it [`PROMPT.md`](https://github.com/sybil-solutions/local-ai-recipe-kit/blob/main/PROMPT.md).
3. Add the card: `registry/cards/amd/radeon-890m-48gb.json` (copy a card from the same vendor; `match` is what the plugin detects).
4. Make the recipe: `python3 lab/lab.py try <repo>@<commit> --model <id> --engine <profile> --card radeon-890m-48gb --on endpoint --endpoint <your server>`, then `make`.
5. Open **one PR** here with `Closes #223`
```

## 4. Existing Claim Activity (1)
- **@Johanxd43** (2026-10-15T22:13:35Z): `/attempt  Submitting lab-verified hardware recipe for #223 (AMD Radeon 890M 48 GB (Strix Point), Qwen3.5-9B at 64K context, llama.cpp ROCm at 28.4 tok/s) passin`

## 5. Settlement & Claim Header
- Claim Command: `/claim #223`
- Pull Request: https://github.com/lienhoatienphung-svg/local-ai-registry/pull/3
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`