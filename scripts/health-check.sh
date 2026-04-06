#!/usr/bin/env bash
# health-check.sh — verify the instance is healthy after recovery
# Usage: bash scripts/health-check.sh

set -euo pipefail

ERRORS=0

check() {
  local label="$1"
  local cmd="$2"
  if eval "$cmd" &>/dev/null; then
    echo "  ✅ $label"
  else
    echo "  ❌ $label"
    ERRORS=$((ERRORS + 1))
  fi
}

echo "Running health checks..."

check "nginx is running"       "systemctl is-active --quiet nginx"
check "app service is running" "systemctl is-active --quiet app"
check "port 80 is open"        "curl -sf http://localhost > /dev/null"
check "disk usage < 80%"       "[ $(df / | awk 'NR==2{print $5}' | tr -d '%') -lt 80 ]"
check "outbound internet"      "curl -sf https://example.com > /dev/null"

echo ""
if [ "$ERRORS" -eq 0 ]; then
  echo "✅ All checks passed."
else
  echo "❌ $ERRORS check(s) failed — review the output above."
  exit 1
fi
