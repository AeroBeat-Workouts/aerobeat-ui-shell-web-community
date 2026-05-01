# AeroBeat UI Shell - Web Community Edition

This repository is the **future-facing community web UI shell** for AeroBeat.

It is **not** the current official AeroBeat v1 delivery surface. The locked v1 direction is **PC community first** with **camera-first Boxing + Flow**. This web shell stays in the ecosystem as a preserved browser-target shell for later experimentation, follow-up platform work, and community exploration.

## 📋 Repository Truth

- **Type:** UI shell package / plugin boundary
- **Platform status:** Future / deprioritized web shell, not current official v1 delivery
- **License:** **GNU GPLv3** (strict copyleft)
- **Primary runtime contract:** `aerobeat-ui-core`
- **Pinned visual layer:** `aerobeat-ui-kit-community`
- **Dev/test framework:** `gut`
- **Package manifest note:** this repo does **not** currently ship a `package.json`; the repo-root package boundary is described by `plugin.cfg` and the GodotEnv testbed manifest

## Scope note

Keep this repo honest about its role:

- preserve a browser-shell seam for future platform work
- avoid claiming current v1 platform parity
- do not imply official mobile/web/XR release status
- keep dependency language limited to what this shell actually consumes

## GodotEnv development flow

This repo uses the AeroBeat GodotEnv UI shell convention.

- Canonical dev/test manifest: `.testbed/addons.jsonc`
- Installed dev/test addons: `.testbed/addons/`
- GodotEnv cache: `.testbed/.addons/`
- Hidden workbench project: `.testbed/project.godot`
- Repo-local unit tests: `.testbed/tests/`

The repo root remains the package/published boundary for downstream consumers. Day-to-day development, debugging, and validation happen from the hidden `.testbed/` workbench using the pinned OpenClaw toolchain: Godot `4.6.2 stable standard`.

### Restore dev/test dependencies

From the repo root:

```bash
cd .testbed
godotenv addons install
```

That restores the current dev/test manifest into `.testbed/addons/`.

### Open the workbench

From the repo root:

```bash
godot --editor --path .testbed
```

Use this `.testbed/` project as the canonical direct-development and bugfinding surface for future web shell work.

### Import smoke check

From the repo root:

```bash
godot --headless --path .testbed --import
```

### Run unit tests

From the repo root:

```bash
godot --headless --path .testbed --script addons/gut/gut_cmdln.gd \
  -gdir=res://tests \
  -ginclude_subdirs \
  -gexit
```

### Validation notes

- `.testbed/addons.jsonc` is the committed dev/test dependency contract.
- The canonical shell dependency story for this repo is `aerobeat-ui-core` + `aerobeat-ui-kit-community` + `gut` for tests.
- Repo-local unit tests live under `.testbed/tests/`.
- The current package shape is consumed from the repo root (`subfolder: "/"`) for downstream installs.
