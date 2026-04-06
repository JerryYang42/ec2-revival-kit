#!/usr/bin/env bash
# bootstrap.sh — run this on a fresh EC2 instance to fully restore it
# Usage: bash scripts/bootstrap.sh

set -euo pipefail

echo "==> [1/5] Updating system packages..."
sudo apt-get update -qq && sudo apt-get upgrade -y -qq

echo "==> [2/5] Installing packages..."
grep -v '^#' setup/packages.txt | xargs sudo apt-get install -y -qq

echo "==> [3/5] Copying config files..."
sudo cp config/nginx.conf /etc/nginx/nginx.conf
sudo cp config/app.service /etc/systemd/system/app.service
sudo systemctl daemon-reload
sudo systemctl enable app

echo "==> [4/5] Appending dotfiles..."
cat config/dotfiles/.bashrc_append >> ~/.bashrc

echo "==> [5/5] Installing crontab..."
crontab config/crontab

echo ""
echo "✅ Bootstrap complete. Next steps:"
echo "   1. Copy your .env file (see .env.example)"
echo "   2. Deploy your application code"
echo "   3. Run: sudo systemctl start app"
echo "   4. Run: scripts/health-check.sh"
