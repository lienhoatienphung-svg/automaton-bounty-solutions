# Bounty Technical Analysis, Patch & PR — `Element-Ventures-Canada-Ltd/openchokepoint#17`

- **Target Issue**: [[Slice B] Verifiable evidence pointers: prove a record exists without disclosing it](https://github.com/Element-Ventures-Canada-Ltd/openchokepoint/issues/17)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: [fix/issue-17](https://github.com/lienhoatienphung-svg/openchokepoint/tree/fix/issue-17)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/openchokepoint/pull/1](https://github.com/lienhoatienphung-svg/openchokepoint/pull/1)
- **Inspected Source File**: `tools/validate.py`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T19:39:31.660Z`

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

Real evidence records (build records, heat-treatment certificates, inspection results) can never be published here. Today the schema can only say "a record of this kind is claimed to exist". To let real suppliers take part safely, a supplier needs a way to **prove** a specific record exists and has not changed, without revealing its content.

## The problem

Design and prototype a **verifiable EvidenceRecord pointer**: the record's holder publishes a content hash and a signed claim; a third party with authorized access can later confirm the hash matches the record they were shown.

## Scope

1. **Design note** (`docs/verifiable-evidence.md`): threat model (who might forge, alter or replay a claim), the claim format, key management assumptions, and what the design does **not** protect against. Consider alignment with the W3C Verifiable Credentials Data Model 2.0 and W3C PROV-O; justify the choice.
2. **Schema proposal:** optional fields on EvidenceRecord for hash algorithm, digest, issuer identifier and signature reference, with a version bump to `0.3.0-draft`.
3. **Validator rules** in `tools/validate.py`: reject ma
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #17`
- Pull Request: https://github.com/lienhoatienphung-svg/openchokepoint/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`