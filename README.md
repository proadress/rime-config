# macOS personal configuration

This repository is the source of truth for portable Squirrel/Rime
input-method settings used on this Mac. More tools can be added as their
configuration is audited.

## Layout

- `input-method/rime/`: portable Squirrel/Rime custom YAML files.
- `input-method/rime/bopomofo_pro.schema.yaml`: optional Traditional-Chinese
  language-model test scheme for Zhuyin.
- `input-method/rime/bopomofo_pro_wx.schema.yaml`: experimental variant of
  `bopomofo_pro` using the much larger Wanxiang grammar model, for comparison.
- `scripts/backup.sh`: copy approved local settings into this repository.
- `scripts/restore.sh`: restore approved settings and reload Squirrel.
- `scripts/verify.sh`: compare repository settings with the active machine.
- `scripts/setup.sh`: one-command fresh-machine setup (installs the language
  model, restores all settings, then verifies).
- `scripts/install-wanxiang-model.sh`: optional, separate install step for
  the `bopomofo_pro_wx` test scheme's much larger grammar model.
- `docs/machine-setup.md`: current machine inventory and maintenance rules.

## Daily workflow

After changing an input-method setting locally:

```sh
./scripts/backup.sh
./scripts/verify.sh
git diff
```

On a fresh or reinstalled Mac, after cloning this repository:

```sh
./scripts/setup.sh
```

## Safety boundary

Only reproducible configuration belongs here. Generated builds, user
dictionaries, sync state, machine identifiers, passwords, tokens, and
one-time codes are intentionally excluded.

The Zhuyin test schemes each use a separately downloaded language-model
file (10 MB for `bopomofo_pro`, ~400 MB for the experimental
`bopomofo_pro_wx`). Their sources, licenses, and revisions/checksums (where
pinnable) are documented in `input-method/rime/models/README.md`; the
binaries are excluded from Git.
