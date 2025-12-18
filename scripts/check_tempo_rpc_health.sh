#!/usr/bin/env bash
set -euo pipefail

RPC_URL="${1:-http://localhost:8545}"

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is not installed" >&2
  exit 1
fi

REQUEST='{"jsonrpc":"2.0","id":1,"method":"eth_chainId","params":[]}'

echo "Checking Tempo RPC at $RPC_URL..."
HTTP_CODE=$(curl -sS -o /tmp/tempo_rpc_health.json -w "%{http_code}" \
  -H "Content-Type: application/json" \
  -d "$REQUEST" \
  "$RPC_URL" || echo "000")

if [ "$HTTP_CODE" != "200" ]; then
  echo "RPC health check failed, HTTP status: $HTTP_CODE"
  exit 1
fi

echo "RPC health check succeeded. Raw response:"
cat /tmp/tempo_rpc_health.json
