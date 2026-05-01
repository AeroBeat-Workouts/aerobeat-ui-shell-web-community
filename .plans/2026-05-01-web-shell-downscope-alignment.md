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

### Task 1: Audit and align repo truth

**Bead ID:** `oc-gfl`  
**SubAgent:** `primary`  
**Role:** `coder`  
**References:** `REF-01`, `REF-02`, `REF-03`, `REF-04`, `REF-05`, `REF-06`  
**Prompt:** Claim the assigned bead, audit the repo against the downscoped AeroBeat docs truth, implement the required alignment changes, run relevant validation, commit/push to `main`, and leave concise handoff notes for QA.

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

**Status:** ✅ Complete

**Results:**
- Reworded `README.md` so the repo now explicitly identifies itself as a future/deprioritized web shell and states that official v1 remains PC community first with camera-first Boxing + Flow (`REF-04`, `REF-05`).
- Removed the stale `aerobeat-core` dependency from `.testbed/addons.jsonc`, leaving the manifest aligned to the shell's actual dependency story: `aerobeat-ui-core`, `aerobeat-ui-kit-community`, and `gut` (`REF-04`, `REF-06`).
- Updated `plugin.cfg` description and `.testbed/project.godot` testbed name so metadata no longer implies an active primary shell.
- Replaced the generic example GUT script with a small repo-truth smoke test that encodes the current future-facing / PC-first positioning expectations.
- Validation initially failed before restoring testbed addons because `gut` was not installed locally; after `godotenv addons install`, import and GUT validation passed.
- No additional follow-up bead was required from this repo-local pass.

---

## Final Results

**Status:** ✅ Complete

**What We Built:** A narrowed repo-truth pass that makes the web shell read as preserved future platform work instead of current official v1 delivery, while cleaning the dev/test manifest to match the shell's actual dependency boundary.

**Reference Check:**
- `REF-04` satisfied: README and metadata now preserve PC-first, camera-first v1 messaging.
- `REF-05` satisfied: web shell is labeled as future-platform work, not current-focus delivery.
- `REF-06` satisfied: testbed/test locations remain the canonical validation surface.

**Commits:**
- `936dcc5` - Downscope-align future web shell truth

**Lessons Learned:**
- In these shell repos, dependency truth and platform-status messaging drift together; fixing one without the other leaves confusing package metadata behind.
- Running import/tests without restoring `.testbed` addons first can produce misleading failures, so `godotenv addons install` is part of the practical validation sequence.

---

*Completed on 2026-05-01*
