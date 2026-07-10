# macOS personal configuration

This repository is the source of truth for portable settings used on this Mac.
It currently covers Squirrel/Rime input-method settings and Maccy's safe,
portable clipboard preferences. More tools can be added as their configuration
is audited.

## Layout

- `input-method/rime/`: portable Squirrel/Rime custom YAML files.
- `input-method/rime/bopomofo_pro.schema.yaml`: optional Traditional-Chinese
  language-model test scheme for Zhuyin.
- `clipboard/maccy/settings.sh`: Maccy's portable shortcuts and behavior.
- `scripts/backup.sh`: copy approved local settings into this repository.
- `scripts/restore.sh`: restore approved settings and reload Squirrel.
- `scripts/verify.sh`: compare repository settings with the active machine.
- `docs/machine-setup.md`: current machine inventory and maintenance rules.

## Daily workflow

After changing an input-method setting locally:

```sh
./scripts/backup.sh
./scripts/verify.sh
git diff
```

On a fresh or reinstalled Mac:

```sh
./scripts/install-bopomofo-pro-model.sh
./scripts/restore.sh
./scripts/verify.sh
```

## Safety boundary

Only reproducible configuration belongs here. Generated builds, user
dictionaries, sync state, machine identifiers, clipboard contents, clipboard
history databases, passwords, tokens, and one-time codes are intentionally
excluded.

The Zhuyin test scheme uses one separately downloaded 10 MB language-model
file. Its source, license, pinned revision, and checksum are documented in
`input-method/rime/models/README.md`; the binary is excluded from Git.
