# Bounty Technical Analysis, Patch & PR — `AstralDeep/AstralDeep#220`

- **Target Issue**: [Exercise LETS receipt enforcement through real MCP, A2A and voice entry routes](https://github.com/AstralDeep/AstralDeep/issues/220)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Fork Fix Branch**: [fix/issue-220](https://github.com/lienhoatienphung-svg/AstralDeep/tree/fix/issue-220)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/AstralDeep/pull/1](https://github.com/lienhoatienphung-svg/AstralDeep/pull/1)
- **Inspected Source File**: `backend/tests/test_lets_dispatch_matrix.py`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T21:26:49.411Z`

## 1. Repository Root Structure (`AstralDeep/AstralDeep`)
- `.agents`
- `.dockerignore`
- `.env.example`
- `.gitattributes`
- `.github`
- `.gitignore`
- `.gitleaks.toml`
- `.gitleaksignore`
- `.gitmodules`
- `.specify`
- `AGENTS.md`
- `CONTRIBUTING.md`
- `Dockerfile`
- `Dockerfile.voice`
- `Dockerfile.voice.dockerignore`
- `LICENSE.md`
- `Makefile`
- `README.md`
- `backend`
- `components`
- `config`
- `contracts`
- `deploy`
- `docker-compose.staging.yml`
- `docker-compose.voice-integration.yml`
- `docker-compose.yml`
- `docs`
- `migration`
- `pyproject.toml`
- `ruff.toml`
- `scripts`
- `sdk`
- `specs`
- `tooling`
- `uv.lock`

## 2. Inspected Source File (`backend/tests/test_lets_dispatch_matrix.py`)
```
"""Tests for orchestrator/governed_dispatch.py: every physical dispatch path reaches the
governed final seam, exercised as one matrix over lets_conformance_support fixtures.
"""

from __future__ import annotations

from types import SimpleNamespace
from unittest.mock import AsyncMock

import pytest

from orchestrator.governed_dispatch import DispatchRuntime, GovernedFinalDispatch
from tests.lets_conformance_support import (
    AUTHORIZED_EFFECT,
    FINAL_ARGUMENTS,
    Plane,
    build_rig,
    invoke_executor,
)


_DISPATCH_PATHS = [
    ("REST", "rest", "server_dynamic"),
    ("WebSocket", "websocket", "server_dynamic"),
    ("A2A", "a2a", "server_dynamic"),
    ("MCP", "mcp", "server_dynamic"),
    ("background", "background", "server_dynamic"),
    ("scheduled", "scheduled", "server_dynamic"),
    ("chained", "chained", "server_dynamic"),
    ("recursive", "chained", "server_dynamic"),
    ("component", "websocket", "server_dynamic"),
    ("probe", "rest", "server_dynamic"),
    ("poll", "stream", "server_dynamic"),
    ("push", "stream", "server_dynamic"),
    ("in-process", "mcp", "server_dynamic"),
    ("generated", "mcp", "server_dynamic"),
    ("BYO", "websocket", "byo_u
```

## 3. Issue Specification Excerpt
```markdown
<!-- astral-bounty-id: AD-11 -->

The current dispatch matrix varies channel labels and calls GovernedFinalDispatch.execute directly. Other tests cover executor seams, but that matrix alone cannot prove authenticated HTTP/WebSocket ingress carries the final arguments, owner and runtime fence to the receipt-protected effect. Add a compact composed regression layer for MCP, A2A and voice ingress.

**Bounty:** 200 points · **Priority:** P2 · **Type:** test

Points only; no monetary payment.

**Review ID:** `AD-11` · **Reviewed revision:** [6cd4b22641d7](https://github.com/AstralDeep/AstralDeep/commit/6cd4b22641d7c08b7e50e945602d52ccd4489215)

## Scope

Add deterministic ASGI/WebSocket ingress tests for one generated protected executor, a faithful local warden fixture and a real test Plane database. Cover approved external mediated-only posture honestly; do not silently extend LETS claims to ungoverned populations.

## Acceptance criteria

- [ ] Run the same benign logical tool effect through MCP, A2A and an accepted voice turn; each governed call binds owner, runtime generation, channel and final argument digest.
- [ ] Revoked receipt, stale generation, duplicate attempt, modified fin
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #220`
- Pull Request: https://github.com/lienhoatienphung-svg/AstralDeep/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`