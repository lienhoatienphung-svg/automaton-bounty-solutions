# Bounty Technical Analysis, Patch & PR — `Element-Ventures-Canada-Ltd/openchokepoint#16`

- **Target Issue**: [[Slice A] Public-evidence coverage score and gap atlas](https://github.com/Element-Ventures-Canada-Ltd/openchokepoint/issues/16)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: [fix/issue-16](https://github.com/lienhoatienphung-svg/openchokepoint/tree/fix/issue-16)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/openchokepoint/pull/4](https://github.com/lienhoatienphung-svg/openchokepoint/pull/4)
- **Inspected Source File**: `examples/synthetic-turbopump-thread.yaml`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T19:46:12.351Z`

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

## 2. Inspected Source File (`examples/synthetic-turbopump-thread.yaml`)
```
# Handling: Unclassified — public
# SYNTHETIC EXAMPLE ONLY — every name, part number, serial, lot, issuer and source below is fictional.
# Schema v0.2.0-draft. Traces fictional rotor serial R-100-0007 end to end (material lot -> build ->
# four post-processing steps -> cleaning -> inspection -> assembly), each step with an EvidenceRecord.
# A second serial, R-100-0008, shows a cleaning step with NO EvidenceRecord: the gap is shown, not filled.
# Hashes are placeholders. No technical data: step kinds only, never parameters or results.

objects:
  # ---- organizations and sites (fictional) ----
  - { type: Entity, id: ent-1001, name: "Northfield Test Foundry", entity_kind: company, incorporation_jurisdiction: CA,
      controlling_jurisdiction: CA, evidence_grade: confirmed, sources: ["https://example.org/synthetic/ent-1001"],
      as_of: 2026-10-07, lifecycle: active, synthetic: true }
  - { type: Entity, id: ent-1002, name: "Example Rotor Works", entity_kind: company, incorporation_jurisdiction: CA,
      controlling_jurisdiction: CA, evidence_grade: confirmed, sources: ["https://example.org/synthetic/ent-1002"],
      as_of: 2026-10-07, lifecycle: active, synthetic: true }
  - { 
```

## 3. Issue Specification Excerpt
```markdown
Handling: Unclassified — public

Part of #3.

## Why this matters

A trace that shows where the public record runs out is as valuable as one that is complete. Gaps tell programmes, insurers and regulators which evidence must be generated or shared under agreement, because it cannot be found in public. This slice turns gaps into a measurable, comparable number.

## The problem

Define and implement a **public-evidence coverage score** for any digital-thread trace in this repository, and a **gap atlas** that shows where the public record stops across all traces.

## Scope

1. **Method note** (`docs/coverage-score.md`): which evidence steps count as required for a flight-critical rotating part (using the ProcessStep kinds already in the schema), how coverage is scored, and how `confirmed` vs `reported` evidence grades are weighted. Plain language; one worked example.
2. **Tool** (`tools/coverage.py`): reads any trace under `data/digital-thread/` or `examples/` and reports coverage overall and by step kind. Pure function of the YAML; no network access.
3. **Gap atlas** (`docs/gap-atlas.md`, generated): one table across all traces showing, per step kind, where public evidence exists, wh
```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #16`
- Pull Request: https://github.com/lienhoatienphung-svg/openchokepoint/pull/4
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`