#!/usr/bin/env bash
set -euo pipefail

# Checks whether typical Tempo localnet ports are in use.

PORTS=(
  "8545"
  "26657"
)

echo "Checking localnet-related ports..."

for port in "${PORTS[@]}"; do
  if lsof -i :"${port}" >/dev/null 2>&1; then
    echo "⚠️  Port ${port} appears to be in use."
  else
    echo "✅ Port ${port} is free."
  fi
done
