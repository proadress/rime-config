# Machine setup inventory

Last checked: 2026-07-10

## Input method

- Squirrel is installed at `/Library/Input Methods/Squirrel.app`.
- Active Rime directory: `~/Library/Rime`.
- Portable files tracked here: `default.custom.yaml` and
  `squirrel.custom.yaml`.
- Generated `build/`, `*.userdb/`, `installation.yaml`, and `user.yaml` remain
  local and are not backed up by this repository.
- Optional test scheme: `bopomofo_pro` adds a Traditional-Chinese word-level
  grammar model without changing the existing `bopomofo` scheme.

## Clipboard

- Maccy 2.6.1 is installed at `/Applications/Maccy.app` and has Accessibility
  permission.
- Its safe portable settings are held in `clipboard/maccy/settings.sh`.
- Its live history is stored under
  `~/Library/Containers/org.p0deje.Maccy/Data/Library/Application Support/Maccy/`
  and is never collected.

## Maintenance rule

Audit a tool before adding it. Track only portable, reviewable settings and add
an explicit ignore rule for any content database, identity file, or secret.
