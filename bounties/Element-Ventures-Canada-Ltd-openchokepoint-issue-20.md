# Bounty Technical Analysis, Patch & PR — `Element-Ventures-Canada-Ltd/openchokepoint#20`

- **Target Issue**: [[Slice E] Comparative real-world traces: retired engines under one method](https://github.com/Element-Ventures-Canada-Ltd/openchokepoint/issues/20)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Web3 Crypto Bounty & Smart Contract Security Unit: GitHub Bounty  BOOTSTRAP-001 
- **Fork Fix Branch**: [fix/issue-20](https://github.com/lienhoatienphung-svg/openchokepoint/tree/fix/issue-20)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/openchokepoint/pull/5](https://github.com/lienhoatienphung-svg/openchokepoint/pull/5)
- **Inspected Source File**: `tools/validate.py`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T19:55:22.669Z`

## 1. Repository Root Structure (`Element-Ventures-Canada-Ltd/openchokepoint`)
- `.github`
- `.gitignore`
- `ACKNOWLEDGEMENTS.md`
- `BOUNTIES.md`
- `CCLA.md`
- `CLA.md`
- `CODE_OF_CONDUCT.md`
- `CONTRIBUTING.md`
- `CONTRIBUTION-SCOPE.md`
- `DATA-CONTRIBUTIONS.md`
- `EXPORT-CONTROL.md`
- `FEEDBACK.md`
- `GOVERNANCE.md`
- `HANDLING.md`
- `LEDGER.md`
- `LICENSE`
- `LICENSING.md`
- `MAINTAINERS.md`
- `NOTICE`
- `PROGRAM.md`
- `README.md`
- `ROADMAP.md`
- `SECURITY.md`
- `apps`
- `data`
- `docs`
- `examples`
- `schema`
- `sdk`
- `tests`
- `tools`

## 2. Inspected Source File (`tools/validate.py`)
```
#!/usr/bin/env python3
# Handling: Unclassified — public
# SPDX-License-Identifier: Apache-2.0
"""Validate instance files against the OpenChokepoint schema.

Usage:
    python3 tools/validate.py [--tier public|private] [instance.yaml ...]

--tier public (default) is for this public repository and its CI. --tier private is for private clones that hold full data.

Defaults to the synthetic examples. Requires PyYAML. Exits non-zero on any error.
Records outside data/ must carry `synthetic: true`. Real records are accepted only under data/ with a provenance.yaml (see DATA-CONTRIBUTIONS.md).

Schema v0.2 adds digital-thread rules. Each error starts with a stable rule ID so reviewers can cite it:
  EV-001  EvidenceRecord must carry a content hash or a public citation
  EV-002  EvidenceRecord must not carry inline content; content_hash must be sha256:<64 hex>; short strings only
  EV-003  EvidenceRecord citation must be a public https URL
  EV-004  A real EvidenceRecord must use a public citation (public reports only)
  CI-001  CriticalItem must be synthetic: true
  CI-002  CriticalItem must not flag, or be offered an alternate by, a real record
  CI-003  CriticalItem must not reach a rea
```

## 3. Issue Specification Excerpt
```markdown
Handling: Unclassified — public

Part of #3.

## Why this matters

One trace is an example. Several traces under the same method are a dataset: they show whether the public record is systematically thin at the same points across programmes.

## The problem

Add real-world traces for **retired** engines, each following the same method as the F-1 trace (assigned in #3), so they can be compared in the gap atlas (#16).

## Candidate programmes

Retired programmes only, for example **J-2** and **H-1**. Propose others with a reason. Active commercial or military engines are out of scope.

## Scope (per trace)

- `data/digital-thread/<engine>-<component>/` with records and a complete `provenance.yaml`.
- Every record cites a working URL and section. Records **point to** sources; they never carry technical content (no material properties tied to a lot, process parameters, heat-treat or inspection schedules, dimensions, drawings or performance data).
- Gaps stay as missing EvidenceRecords. Nothing is inferred.
- Rule DT-003: records show which steps happened, not their order.

## Acceptance test

- `tools/validate.py` passes.
- Every cited URL resolves and the cited section exists (the main
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #20`
- Pull Request: https://github.com/lienhoatienphung-svg/openchokepoint/pull/5
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`