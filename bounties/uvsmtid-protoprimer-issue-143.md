# Bounty Technical Analysis, Patch & PR — `uvsmtid/protoprimer#143`

- **Target Issue**: [Add `ShellDriverSh`: use `/bin/sh` when `SHELL` is not set](https://github.com/uvsmtid/protoprimer/issues/143)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Automated Test Suite Generation & Sentry Bug Triage
- **Fork Fix Branch**: [fix/issue-143](https://github.com/lienhoatienphung-svg/protoprimer/tree/fix/issue-143)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/protoprimer/pull/1](https://github.com/lienhoatienphung-svg/protoprimer/pull/1)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T17:40:50.434Z`

## 1. Repository Root Structure (`uvsmtid/protoprimer`)
- `.editorconfig`
- `.gemini`
- `.github`
- `.gitignore`
- `.run`
- `cmd`
- `doc`
- `dst`
- `gconf`
- `license.md`
- `prime`
- `readme.md`
- `src`


## 3. Issue Specification Excerpt
```markdown
## Problem

`_get_shell_driver` fails on minimal systems (e.g. containers which have only `/bin/sh`):

*   `SHELL` is not set: it warns and assumes `bash` (via `shutil.which("bash")`),
    then hits `assert shell_abs_path is not None` when `bash` is not in `PATH`.
*   `SHELL=/bin/sh`: it raises `ValueError` (unknown shell).

Only `ShellType.shell_bash` / `ShellType.shell_zsh` (with `ShellDriverBash` / `ShellDriverZsh`) exist today.

Background and design notes: [`doc/task_ref/TODO_74_35_76_27.shell_driver_fallback_to_sh.md`](https://github.com/uvsmtid/protoprimer/blob/main/doc/task_ref/TODO_74_35_76_27.shell_driver_fallback_to_sh.md)

## Scope

*   **Fallback:** when `SHELL` is not set, `_get_shell_driver` returns `ShellDriverSh` (using `/bin/sh`).
    It no longer assumes `bash` (the `which("bash")` lookup and its `assert` are removed).
*   **Recognition:** when `SHELL` has the basename `sh` (e.g. `SHELL=/bin/sh`), `_get_shell_driver` returns `ShellDriverSh`.
*   **Other unknown shells** (e.g. `/bin/fish`) still raise `ValueError`.
*   **`ShellDriverSh` is POSIX-only:**
    *   It must work with any `sh` implementation (`dash`, `busybox ash`, `bash` in `sh` mode, etc.).
    *   It
```

## 4. Existing Claim Activity (4)
- **@bookkuybig** (2026-10-15T14:59:23Z): `/attempt #143`
- **@jj-schultz** (2026-10-15T16:19:23Z): `PR #144's new shell test copies the parent environment and only checks that `VIRTUAL_ENV` is nonempty. In a standalone `/bin/sh -i` probe, that assertion passes`
- **@Bloders-hub** (2026-10-15T16:23:01Z): `Good catch regarding parent test runner environment isolation, @jj-schultz!  Just pushed an update to PR #144 (commit `4f92be1`): 1. `env.pop('VIRTUAL_ENV', Non`
- **@menwo535-jpg** (2026-10-15T17:09:57Z): `Hi @uvsmtid, I see another contributor is already working on PR #144. Are you still accepting other contributors for #143, and could the bounty be paid in USD v`

## 5. Settlement & Claim Header
- Claim Command: `/claim #143`
- Pull Request: https://github.com/lienhoatienphung-svg/protoprimer/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`