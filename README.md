# Squirrel / Rime config

Portable Squirrel and Rime custom configuration exported from:

```text
~/Library/Rime
```

## Included

- `default.custom.yaml`: global Rime key and behavior overrides.
- `squirrel.custom.yaml`: Squirrel app-specific overrides.

## Not included

The following local/generated files are intentionally not tracked:

- `build/`
- `sync/`
- `*.userdb/`
- `installation.yaml`
- `user.yaml`

These files contain generated build output, sync state, user dictionaries, or machine-specific identity.

## Install

Copy the tracked YAML files into `~/Library/Rime`, then reload Squirrel:

```sh
cp default.custom.yaml squirrel.custom.yaml ~/Library/Rime/
/Library/Input\ Methods/Squirrel.app/Contents/MacOS/Squirrel --reload
```

To verify app-specific settings after reload:

```sh
grep -A4 "com.microsoft.VSCode" ~/Library/Rime/build/squirrel.yaml
grep -A2 "com.apple.Terminal" ~/Library/Rime/build/squirrel.yaml
```
