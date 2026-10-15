# Bounty Technical Analysis, Patch & PR — `ditto-assistant/ditto-subnet#2872`

- **Target Issue**: [Miner CLI: sign the contributor licence agreement (CLA) with the miner hotkey](https://github.com/ditto-assistant/ditto-subnet/issues/2872)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: DeepPulse Unindexed API & Algora PR Bounty Harvester
- **Fork Fix Branch**: [fix/issue-2872](https://github.com/lienhoatienphung-svg/ditto-subnet/tree/fix/issue-2872)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/ditto-subnet/pull/6](https://github.com/lienhoatienphung-svg/ditto-subnet/pull/6)
- **Inspected Source File**: `ditto/miner_cli/name_claim.py`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T19:19:38.893Z`

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

## 2. Inspected Source File (`ditto/miner_cli/name_claim.py`)
```
"""Mint a signed handle claim, endorsement, or withdrawal.

Signing a message does not move funds. Every function here hands a byte
string to a keypair's ``sign`` method. The server-side builders live in
``ditto/api_server/name_claim.py``; these are a byte-for-byte mirror.
"""

from __future__ import annotations

from datetime import UTC
from typing import TYPE_CHECKING, Final, Literal
from uuid import UUID

if TYPE_CHECKING:
    from datetime import datetime

    import bittensor

CLAIM_DOMAIN: Final = "ditto-name-claim:v1"
ENDORSE_DOMAIN: Final = "ditto-name-endorse:v1"
WITHDRAW_DOMAIN: Final = "ditto-name-withdraw:v1"

KeyKind = Literal["hotkey", "coldkey"]


def _issued_stamp(issued_at: datetime) -> str:
    return issued_at.astimezone(UTC).isoformat(timespec="microseconds")


def claim_message(
    *,
    netuid: int,
    name_stem: str,
    claimant_hotkey: str,
    nonce: UUID,
    issued_at: datetime,
    key_kind: KeyKind,
    signer: str,
) -> bytes:
    issued = _issued_stamp(issued_at)
    return (
        f"{CLAIM_DOMAIN}:{netuid}:{name_stem}:{claimant_hotkey}:{nonce}:{issued}"
        f":{key_kind}:{signer}"
    ).encode()


def endorse_message(
    *,
    netuid: int
```

## 3. Issue Specification Excerpt
```markdown
## Goal

Contributions to SN118 are MIT-licensed under a Contributor License Agreement. In the CLA, the contributor gives up IP claims to the work they submit. The miner executes the CLA by **signing it with their hotkey** from the `uv run ditto` CLI. Platform verifies and stores that signature, and refuses submissions from hotkeys that have not signed the current version.

This covers miner agent uploads and bounty contributions (#2054). Winning work can then ship in Ditto products without a separate rights negotiation per contributor.

> **Contributors build the plumbing only.** Maintainers supply the CLA text, which is still under legal review. Use a clearly marked placeholder fixture in tests, and don't draft or edit the legal wording.

## Proposed mechanics

1. **Versioned, pinned text.** The CLA lives at `docs/legal/CLA-v<N>.md`. Platform holds a registry of `{version, sha256, published_at, effective_at}`. The CLI downloads the text, recomputes the SHA-256, and refuses to sign on a mismatch.
2. **`ditto cla sign`.** The CLI shows the CLA, or the path to it plus its digest, and asks for explicit typed confirmation. It then signs, with the hotkey (sr25519):

   ```
   ditto-cla
```

## 4. Existing Claim Activity (1)
- **@planners1490** (2026-10-13T18:56:20Z): `I have implemented the full CLA signing plumbing and opened PR https://github.com/ditto-assistant/ditto-subnet/pull/2879 for review:  - **Alembic migration**: ``

## 5. Settlement & Claim Header
- Claim Command: `/claim #2872`
- Pull Request: https://github.com/lienhoatienphung-svg/ditto-subnet/pull/6
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`