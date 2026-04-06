#!/usr/bin/env bash
# backup.sh — snapshot key data to S3 (runs nightly via cron)
# Usage: bash scripts/backup.sh

set -euo pipefail

# TODO: set your S3 bucket name
S3_BUCKET="${BACKUP_S3_BUCKET:-your-backup-bucket}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/tmp/backup_$TIMESTAMP"

echo "[$TIMESTAMP] Starting backup..."
mkdir -p "$BACKUP_DIR"

# --- Add your backup steps below ---

# Example: backup a SQLite database
# cp /home/ubuntu/app/db.sqlite "$BACKUP_DIR/db.sqlite"

# Example: backup uploaded files
# cp -r /home/ubuntu/app/uploads "$BACKUP_DIR/uploads"

# --- Upload to S3 ---
# aws s3 cp "$BACKUP_DIR" "s3://$S3_BUCKET/backups/$TIMESTAMP/" --recursive

# --- Cleanup ---
rm -rf "$BACKUP_DIR"

echo "[$TIMESTAMP] Backup complete."
