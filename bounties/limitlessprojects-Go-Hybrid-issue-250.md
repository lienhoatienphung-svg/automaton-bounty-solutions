# Bounty Technical Analysis & Solution — `limitlessprojects/Go-Hybrid#250`

- **Target Issue**: [[soundness] Named return bindings ((out T)) and bare eturn are invisible to hy-check, bypassing O4/O5/O8/O2/N1 (HYB-E3001/E3003/E3004/E3102/E3104/E4001/E3011)](https://github.com/limitlessprojects/Go-Hybrid/issues/250)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T20:39:02.602Z`

## 1. Repository Root Structure (`limitlessprojects/Go-Hybrid`)
- `.all-contributorsrc`
- `.dockerignore`
- `.github`
- `.gitignore`
- `AGENTS.md`
- `BOUNTY.md`
- `CONTRIBUTING.md`
- `CONTRIBUTOR_RECOGNITION.md`
- `Dockerfile`
- `GUARANTEES.md`
- `LICENSE`
- `LICENSE-APACHE`
- `LICENSE-MIT`
- `MOONSHOT.md`
- `Makefile`
- `PLAN.md`
- `QUESTIONS.md`
- `README.md`
- `SECURITY.md`
- `SPEC-LANGUAGE.md`
- `SPEC.md`
- `STATUS.md`
- `benchmarks`
- `compiler`
- `examples`
- `gates`
- `install.sh`
- `interfaces`
- `jobs`
- `research`
- `runtime`
- `spikes`
- `tests`
- `tools`
- `worker`
- `worklog.md`

## 2. Issue Specification Excerpt
```markdown
### Track
**Track 1 — Soundness (`hy-check` false negatives / Tier-0 invariants O2, O4, O5.1, O5.2, O5.4, O8/A3, N1, and channel typing)**

### Summary
`hy-syntax` (`parser.rs::parse_results`) and `hy-emit` (`lib.rs::emit_fn` / `expr.rs` for `FnLit`) support Go-style named return bindings (`FnResult { name: Some(name), ty }`, e.g. `fn run() (out map[string]int)`) and bare `return` statements (`Stmt::Return { values: [] }`), which lower directly to Go named return parameters (`func run() (out map[string]int) { ... return }`).

However, `hy-check` completely ignores `FnResult.name` across the entire checker (`lib.rs`, `walk.rs`, `closures.rs`, and `loans.rs`), never seeding named result bindings into `FnState::env` or closure environments and never recording uses or loan/escape checks on bare `return`.

On `main` (`44a08b9`), this produces **6 concrete soundness bypasses** that pass `hyc check` with **0 diagnostics** and emit racing or invalid Go code:

---

### Reproducers (all accepted with `0 diagnostics` on `main` `44a08b9`)

#### 1. O4 Sendability & File-Level `const` Laundering (`HYB-E3001` / A1c)
Because `check_fn` (`lib.rs:141–186`) and `check_closures` (`closures.rs:34–59`) 
```

## 3. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 4. Settlement & Claim Header
- Claim Command: `/claim #250`
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`