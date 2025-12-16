# Contribution Style Notes

This document summarizes a few style preferences for contributions to Tempo.
It is not exhaustive, but can help keep pull requests consistent.

## Rust code

- Prefer small, focused modules instead of very large files.
- Use `cargo fmt` to format code before committing.
- Run `cargo clippy` locally when adding more complex logic.

## Documentation

- Write documentation in English.
- Keep sentences short and direct.
- When adding new markdown files, use descriptive filenames (for example,
  `LOCALNET_NOTES.md`, `RPC_TROUBLESHOOTING.md`).

## Shell scripts

- Use `#!/usr/bin/env bash` and `set -euo pipefail` at the top.
- Aim for clear, explicit variable names.
- Print short, user-friendly messages rather than raw command output where possible.

## Commit messages

- Use imperative mood for the subject line, for example:
  - `docs: add localnet quickstart notes`
  - `tools: add check_toolchain script`
- Keep the subject under ~72 characters if possible.

These guidelines are intentionally lightweight. When in doubt, follow the
existing style of the surrounding code and documentation.
