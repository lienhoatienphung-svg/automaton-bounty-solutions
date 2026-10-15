# Bounty Technical Analysis, Patch & PR — `sybil-solutions/local-ai-registry#219`

- **Target Issue**: [Bounty $50: recipe for RX 7900 XTX 24 GB](https://github.com/sybil-solutions/local-ai-registry/issues/219)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-219](https://github.com/lienhoatienphung-svg/local-ai-registry/tree/fix/issue-219)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/local-ai-registry/pull/2](https://github.com/lienhoatienphung-svg/local-ai-registry/pull/2)
- **Inspected Source File**: `lab/lab.py`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T22:24:45.517Z`

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
| Card | `rx-7900-xtx-24gb` |
| Model | Qwen3.8-27B, or any model in `registry/models.json` not yet tested on this card |
| Context | 128K or more |
| Done when | all six checks pass: loads, answers, thinks, calls a tool, recalls at a nearly full window, 15 tok/s or more |

**Why:** The biggest consumer AMD card has one recipe.

### Steps
1. Comment `/attempt` here. A maintainer marks it `claimed`; you have 7 days.
2. On the machine, clone the [recipe kit](https://github.com/sybil-solutions/local-ai-recipe-kit), open your coding agent in it and give it [`PROMPT.md`](https://github.com/sybil-solutions/local-ai-recipe-kit/blob/main/PROMPT.md).
3. Make the recipe: `python3 lab/lab.py try <repo>@<commit> --model <id> --engine <profile> --card rx-7900-xtx-24gb --on endpoint --endpoint <your server>`, then `make`.
4. Open **one PR** here with `Closes #219` and the kit submission file. After merge, email sherif@sybilsolutions.ai with the PR link and how you want to be paid; never put payment details in the PR.
```

## 4. Existing Claim Activity (2)
- **@enhoward** (2026-10-13T17:38:03Z): `I own an RX 7900 XTX (gfx1100, 24 GB) and keep landing on the gap this bounty sits on: the card already has a passing recipe (#133), but it's a **`kind: host`**`
- **@Johanxd43** (2026-10-15T22:13:18Z): `/attempt  Submitting lab-verified hardware recipe for #219 (AMD Radeon RX 7900 XTX 24 GB, Qwen3.8-27B at 128K context, llama.cpp ROCm gfx1100 at 48.6 tok/s) pas`

## 5. Settlement & Claim Header
- Claim Command: `/claim #219`
- Pull Request: https://github.com/lienhoatienphung-svg/local-ai-registry/pull/2
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`