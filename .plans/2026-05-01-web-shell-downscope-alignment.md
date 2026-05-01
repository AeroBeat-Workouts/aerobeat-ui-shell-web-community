# aerobeat-ui-shell-web-community

**Date:** 2026-05-01  
**Status:** In Progress  
**Agent:** Chip 🐱‍💻

---

## Goal

Align `aerobeat-ui-shell-web-community` with the locked AeroBeat v1 downscope so it truthfully presents itself as a future/deprioritized community shell, not current official v1 delivery.

---

## Overview

This repo is part of the AeroBeat UI shell layer follow-up from the parent coordination plan in `openclaw-chip`. The work stayed narrow: inspect README/package/testbed/manifest/dependency surfaces, remove stale scope claims, and ensure this shell's positioning matches the downscoped docs truth.

The main repo-local drift was dependency and positioning language. The README still described transition-era `aerobeat-core` manifest drift, and the testbed manifest still pinned that package even though the current shell truth should be `aerobeat-ui-core` + `aerobeat-ui-kit-community` + `gut` for tests. The repo also needed clearer future-facing messaging so it does not read like an active official v1 shell.

---

## REFERENCES

| ID | Description | Path |
| --- | --- | --- |
| `REF-01` | Parent AeroBeat coordination plan | `/home/derrick/.openclaw/workspace/projects/openclaw-chip/.plans/2026-05-01-aerobeat-ui-shell-downscope-pass.md` |
| `REF-02` | Downscoped docs source of truth | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs` |
| `REF-03` | Owning repo | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-ui-shell-web-community` |
| `REF-04` | Architecture overview with current v1 release direction | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs/docs/architecture/overview.md` |
| `REF-05` | Repository map labeling web shell as future-platform work | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs/docs/architecture/repository-map.md` |
| `REF-06` | Testing guidance for package repos using hidden `.testbed/tests/` | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs/docs/architecture/testing.md` |

---

## Tasks

### Task 1: Audit, align, and QA repo truth

**Bead ID:** `oc-gfl`  
**SubAgent:** `primary`  
**Role:** `coder` → `qa`  
**References:** `REF-01`, `REF-02`, `REF-03`, `REF-04`, `REF-05`, `REF-06`  
**Prompt:** Claim the assigned bead, audit the repo against the downscoped AeroBeat docs truth, implement the required alignment changes, run relevant validation, commit/push to `main`, and leave concise handoff notes for QA. QA must independently rerun validation and assess whether the new tests actually guard repo truth.

**Folders Created/Deleted/Modified:**
- `.plans/`
- `.testbed/`

**Files Created/Deleted/Modified:**
- `README.md`
- `plugin.cfg`
- `.testbed/addons.jsonc`
- `.testbed/project.godot`
- `.testbed/tests/test_example.gd`
- `.testbed/tests/test_example.gd.uid`
- `.plans/2026-05-01-web-shell-downscope-alignment.md`

**Status:** ✅ Audited complete

**Results:**
- Reworded `README.md` so the repo now explicitly identifies itself as a future/deprioritized web shell and states that official v1 remains PC community first with camera-first Boxing + Flow (`REF-04`, `REF-05`).
- Removed the stale `aerobeat-core` dependency from `.testbed/addons.jsonc`, leaving the manifest aligned to the shell's actual dependency story: `aerobeat-ui-core`, `aerobeat-ui-kit-community`, and `gut` (`REF-04`, `REF-06`).
- Updated `plugin.cfg` description and `.testbed/project.godot` testbed name so metadata no longer implies an active primary shell.
- Replaced the generic example GUT script with file-backed repo-truth guardrails that now read committed surfaces instead of asserting local constants.
- The strengthened test now checks `README.md` for future/deprioritized positioning plus PC-first / camera-first wording, parses `plugin.cfg` to pin the future-facing description, and inspects `.testbed/addons.jsonc` to require `aerobeat-ui-core`, `aerobeat-ui-kit-community`, and `gut` while rejecting `aerobeat-core` drift.
- Validation initially failed before restoring testbed addons because `gut` was not installed locally; after `godotenv addons install`, import and GUT validation passed.
- Independent QA recheck on the committed repo verified `README.md`, `plugin.cfg`, `.testbed/project.godot`, `.testbed/addons.jsonc`, and `.testbed/tests/test_example.gd` against `REF-04`, `REF-05`, and `REF-06`.
- Independent QA reran the repo validation flow with `godot --headless --path .testbed --import` and `godot --headless --path .testbed --script addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gexit`; import succeeded and GUT passed 4/4 tests with 17 asserts.
- Independent QA confirmed the committed manifest contains `aerobeat-ui-core`, `aerobeat-ui-kit-community`, and `gut`, and that `aerobeat-core` is absent from `.testbed/addons.jsonc`.
- QA's earlier shallow-test defect is resolved: the current guardrail meaningfully inspects committed repo surfaces instead of only checking local constants.
- Independent auditor spot-check passed: verified docs truth in `REF-04`/`REF-05`, confirmed the committed repo surfaces match that truth, reviewed the implementing commits `5fdac5c`, `ddc9a23`, and `356c1a6`, and reran the headless import + GUT validation flow successfully (4/4 tests, 17 asserts).
- Auditor conclusion: bead `oc-gfl` is complete and can be closed.
- Commit hashes under review: `5fdac5c`, `ddc9a23`, `356c1a6`.

---

## Final Results

**Status:** ✅ Complete

**What We Built:** A narrowed repo-truth pass that makes the web shell read as preserved future platform work instead of current official v1 delivery, cleans the dev/test manifest to match the shell's actual dependency boundary, and enforces that truth through file-backed repo-surface assertions.

**Reference Check:**
- `REF-04` satisfied: README and metadata preserve PC-first, camera-first v1 messaging.
- `REF-05` satisfied: web shell is labeled as future-platform work, not current-focus delivery.
- `REF-06` satisfied: the canonical `.testbed/tests/` guardrail inspects committed repo surfaces (`README.md`, `plugin.cfg`, `.testbed/addons.jsonc`) instead of restating expectations as local constants.
- Auditor spot-check satisfied: fresh rerun of `godot --headless --path .testbed --import` and `godot --headless --path .testbed --script addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gexit` passed with 4/4 tests and 17 asserts.

**Commits:**
- `5fdac5c` - Downscope-align future web shell truth
- `ddc9a23` - Strengthen web shell repo-truth guardrails
- `356c1a6` - Record web shell QA-fix handoff

**Lessons Learned:**
- In these shell repos, dependency truth and platform-status messaging drift together; fixing one without the other leaves confusing package metadata behind.
- Running import/tests without restoring `.testbed` addons first can produce misleading failures, so `godotenv addons install` is part of the practical validation sequence.
- Repo-truth tests only provide real drift protection when they read the committed files they are supposed to defend.

---

*Completed on 2026-05-01*
