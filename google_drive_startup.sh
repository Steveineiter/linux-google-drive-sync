#!/bin/bash
readonly CURRENT_DATE=$(date +%Y-%m-%d)

# Define variables for source and destination.
readonly BACKUP_FOLDER="RcloneBackup"
readonly REMOTE="google_drive:"
readonly LOCAL="$HOME/GoogleDrive"
readonly LOG_FILE="$HOME/.config/rclone/rclone.log"

# Backup files (in case of deletion)
readonly LOCAL_BACKUP="$LOCAL/$BACKUP_FOLDER/$CURRENT_DATE"

# Use --dry-run on first run to check if it works as intended.
# Pull changes from remote into local.
rclone sync "$REMOTE" "$LOCAL" \
  --fast-list \
  --update \
  --create-empty-src-dirs \
  --exclude ".obsidian/" \
  --exclude "$BACKUP_FOLDER/**" \
  --backup-dir "$LOCAL_BACKUP" \
  --log-file="$LOG_FILE" \
  --verbose \
  --progress \
#  --dry-run


