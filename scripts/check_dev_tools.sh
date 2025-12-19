#!/usr/bin/env bash
set -euo pipefail

# Quick sanity check for local Tempo development tooling.
#
# This script verifies that a minimal set of tools is available before running
# local development workflows such as `just`, `cargo nextest run`, or `just localnet`.
#
# It checks for:
#   - cargo
#   - rustc
#   - just
#   - docker
#   - git
#
# Exit codes:
#   0 - all required tools are available
#   1 - one or more required tools are missing

REQUIRED_COMMANDS=(
  "cargo"
  "rustc"
  "just"
  "docker"
  "git"
)

missing=()

for cmd in "${REQUIRED_COMMANDS[@]}"; do
  if ! command -v "${cmd}" >/dev/null 2>&1; then
    missing+=("${cmd}")
  fi
done

if [ "${#missing[@]}" -ne 0 ]; then
  echo "[tempo-dev] Missing required tools:" >&2
  for cmd in "${missing[@]}"; do
    echo "  - ${cmd}" >&2
  done
  echo "[tempo-dev] Please install the tools above before running Tempo local development commands." >&2
  exit 1
fi

echo "[tempo-dev] Development tooling looks good:"
for cmd in "${REQUIRED_COMMANDS[@]}"; do
  version="$(${cmd} --version 2>/dev/null || echo "version not available")"
  echo "  - ${cmd}: ${version}"
done
