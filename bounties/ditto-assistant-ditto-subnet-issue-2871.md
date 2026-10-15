# Bounty Technical Analysis, Patch & PR — `ditto-assistant/ditto-subnet#2871`

- **Target Issue**: [Miner CLI: attest a GitHub account and link it to the miner hotkey](https://github.com/ditto-assistant/ditto-subnet/issues/2871)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: [fix/issue-2871](https://github.com/lienhoatienphung-svg/ditto-subnet/tree/fix/issue-2871)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/ditto-subnet/pull/2](https://github.com/lienhoatienphung-svg/ditto-subnet/pull/2)
- **Inspected Source File**: `ditto/miner_cli/commands/link_ditto.py`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T18:08:00.550Z`

## 1. Repository Root Structure (`ditto-assistant/ditto-subnet`)
- `.agents`
- `.claude`
- `.codex`
- `.depot`
- `.dockerignore`
- `.env.example`
- `.github`
- `.gitignore`
- `.impeccable`
- `AGENTS.md`
- `CHANGELOG.md`
- `CLAUDE.md`
- `Dockerfile`
- `Dockerfile.pylon`
- `Dockerfile.sandbox-docker`
- `Dockerfile.screener-fleet-release`
- `Dockerfile.stack-release`
- `LICENSE`
- `Makefile`
- `README.md`
- `apps`
- `ditto`
- `docker-compose.yml`
- `docs`
- `infra`
- `localstack`
- `miners`
- `packages`
- `preview`
- `pyproject.toml`
- `release`
- `research`
- `scripts`
- `services`
- `tests`
- `uv.lock`
- `workers`

## 2. Inspected Source File (`ditto/miner_cli/commands/link_ditto.py`)
```
"""``ditto link-ditto``: attach your Ditto account to this hotkey.

Signing in with Ditto happens in a browser on dittobench.ai's OpenID flow; the
CLI only starts the attempt under the miner session ``ditto login`` created
(that session is the hotkey proof), opens the consent URL, and waits for the
Platform to confirm the link. No key material, TAO, or Ditto credentials pass
through this command, and the Ditto user id is whatever the Platform verified
from Ditto's signed id_token — never something the CLI asserts.

Subcommands:

- ``link-ditto``          start a link and wait for the browser round trip
- ``link-ditto status``   show the current link for this hotkey
- ``link-ditto unlink``   revoke the link (the Ditto account keeps its own data)

Exit codes: 0 linked / shown / revoked; 1 not signed in, refused, or timed out.
"""

from __future__ import annotations

import argparse
import contextlib
import json
import sys
import time
import webbrowser

from ditto.api_models.miner_ditto_link import (
    MinerDittoLinkStartRequest,
    MinerDittoLinkView,
)
from ditto.miner_cli.api_client import ApiClient
from ditto.miner_cli.errors import ApiResponseError, LoginRequiredError
from dit
```

## 3. Issue Specification Excerpt
```markdown
## Goal

Let a miner prove, from the `uv run ditto` CLI, that they control a GitHub account, and record a verified link between that account and their miner hotkey. Bounties need it: a claim in [docs/bounty-claims.md](https://github.com/ditto-assistant/ditto-subnet/blob/main/docs/bounty-claims.md) currently signs a self-asserted `github_login`, so nothing stops a claimant from naming someone else's account. With a verified link, reviewers can match PRs to claimants and trust the match.

The link is identity only. It never changes where money goes. Bounty-claims principle 1 still holds: **the hotkey decides who you are, and GitHub is only a label.** The payee stays the coldkey signed into the claim.

## Proposed design

This follows `ditto link-ditto` ([`ditto/miner_cli/commands/link_ditto.py`](https://github.com/ditto-assistant/ditto-subnet/blob/main/ditto/miner_cli/commands/link_ditto.py), [`apps/platform/ditto/api_server/endpoints/miner_ditto_link.py`](https://github.com/ditto-assistant/ditto-subnet/blob/main/apps/platform/ditto/api_server/endpoints/miner_ditto_link.py)), which already proves a hotkey and an external account in one round trip:

1. `ditto login` creates the miner 
```

## 4. Existing Claim Activity (2)
- **@planners1490** (2026-10-13T18:56:21Z): `I'd like to take **#2871** next (since #2872's PR check stretch goal builds on this hotkey ↔ GitHub link).  ### Answers to Open Questions & Proposed Architectur`
- **@planners1490** (2026-10-13T18:57:56Z): `I have now submitted the full implementation PR for **#2871** as well: https://github.com/ditto-assistant/ditto-subnet/pull/2880  - **Alembic migration**: `mine`

## 5. Settlement & Claim Header
- Claim Command: `/claim #2871`
- Pull Request: https://github.com/lienhoatienphung-svg/ditto-subnet/pull/2
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`