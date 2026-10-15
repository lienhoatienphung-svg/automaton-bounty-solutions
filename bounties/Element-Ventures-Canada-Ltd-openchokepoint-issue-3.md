# Bounty Technical Analysis, Patch & PR — `Element-Ventures-Canada-Ltd/openchokepoint#3`

- **Target Issue**: [[Priority] Open call: digital-thread and critical-items register schema for rocket turbopump supply chains](https://github.com/Element-Ventures-Canada-Ltd/openchokepoint/issues/3)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: DeepPulse Unindexed API & Algora PR Bounty Harvester
- **Fork Fix Branch**: [fix/issue-3](https://github.com/lienhoatienphung-svg/openchokepoint/tree/fix/issue-3)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/openchokepoint/pull/3](https://github.com/lienhoatienphung-svg/openchokepoint/pull/3)
- **Inspected Source File**: `schema/openchokepoint.yaml`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T19:45:57.678Z`

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

## 2. Inspected Source File (`schema/openchokepoint.yaml`)
```
# Handling: Unclassified — public
# OpenChokepoint schema v0.2.1-draft (working name) — an open grammar for supply-chain dependency registries.
# Types only: no entities, no scores, no assessments. Licensed under Apache-2.0.
# © 2026 T. Leroy Smith. Exclusively licensed to Element Ventures (Canada) Ltd.
#
# v0.2 adds the digital-thread and critical-items types (issue #3). The thread records THAT evidence
# exists and WHERE it sits. It never carries technical content: no geometry, drawings, build parameters,
# process recipes, temperatures, pressures, test data or acceptance limits. See docs/digital-thread.md.
# v0.1 types, links and shared properties are unchanged; v0.1 instance files validate as before.

schema:
  name: openchokepoint
  version: 0.2.1-draft
  status: draft

shared_properties:            # every object and link carries these
  id:             { type: string, required: true }
  name:           { type: string }
  evidence_grade: { type: enum, values: [confirmed, reported, inferred, speculative, no_evidence], required: true }
  sources:        { type: url, many: true, required: true }
  as_of:          { type: date, required: true }
  lifecycle:      { type: enum, val
```

## 3. Issue Specification Excerpt
```markdown
**Track:** Schema · **Priority:** High · **Bounty:** Yes, amount to be posted before assignment (see [BOUNTIES.md](https://github.com/Element-Ventures-Canada-Ltd/openchokepoint/blob/main/BOUNTIES.md)) · **Window:** open now, programme runs to 31 March 2027

Extends seed-backlog item #7 (Component, Lot, MaterialClass).

## Why this matters

Canada is building its first domestic launch supply chains. For rocket turbopumps, the binding constraint is not the design. It is the **evidence chain** that proves each part was made, treated, cleaned and inspected the way it must be. A pump geometry without that pedigree cannot be licensed, insured or flown.

Today there is no open, shared grammar for that evidence chain. Every programme rebuilds it in spreadsheets. That makes the chain hard to inspect, hard to transfer between suppliers, and fragile when people move on.

This issue invites engineers, quality specialists, data modellers and students to design that grammar in the open. The result will be the reference schema that Canadian and allied programmes can adopt without lock-in.

## Problem

OpenChokepoint v0.1 can say *who* supplies *what capability*. It cannot yet say:

1. **Which phy
```

## 4. Existing Claim Activity (3)
- **@aiirvizionz** (2026-10-07T20:55:23Z): `Handling: Unclassified - public  I am an AI-assisted project contributor using this project-owned GitHub account. I do not claim aerospace engineering credentia`
- **@TLS-sys** (2026-10-08T06:20:12Z): `Handling: Unclassified — public  **Maintainer update: v0.2 is merged; one slice remains open**  Thank you to everyone who commented. Your questions shaped the t`
- **@PINYOPATTANAWASANPORN** (2026-10-09T16:53:38Z): `Handling: Unclassified - public  ### Proposed Digital Thread Trace for Real-World Slice (Issue #3)  In accordance with the maintainer update (PR #4 & #5 merged)`

## 5. Settlement & Claim Header
- Claim Command: `/claim #3`
- Pull Request: https://github.com/lienhoatienphung-svg/openchokepoint/pull/3
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`