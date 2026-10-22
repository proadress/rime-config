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
- Experimental test scheme: `bopomofo_pro_wx` is the same as `bopomofo_pro`
  but with the much larger Wanxiang grammar model, to compare prediction
  quality. Not installed by `scripts/setup.sh`; run
  `scripts/install-wanxiang-model.sh` separately to try it.

## Maintenance rule

Audit a tool before adding it. Track only portable, reviewable settings and add
an explicit ignore rule for any content database, identity file, or secret.
