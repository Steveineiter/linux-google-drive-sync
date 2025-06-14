#!/bin/bash
readonly CURRENT_DATE=$(date +%Y-%m-%d)

# Define variables for source and destination.
readonly BACKUP_FOLDER="RcloneBackup"
readonly REMOTE="google_drive:"
readonly LOCAL="$HOME/GoogleDrive"
readonly LOG_FILE="$HOME/.config/rclone/rclone.log"

# This should be higher than the interval this script is called by cronejob/service. 
# Basically it deletes files in local, if we deleted them eg 1 day ago. This is used, because
# else newly created files will always be deleted, even with --update flag.
readonly MIN_AGE_FOR_LOCAL_DELETE="900s" 

# Backup files
readonly REMOTE_BACKUP="$REMOTE/$BACKUP_FOLDER/$CURRENT_DATE"
readonly LOCAL_BACKUP="$LOCAL/$BACKUP_FOLDER/$CURRENT_DATE"

# Use --dry-run on first run to check if it works as intended.
# Pull changes from remote into local. Note that remote deletion won't work while working on this local setup. 
rclone sync "$REMOTE" "$LOCAL" \
  --fast-list \
  --update \
  --create-empty-src-dirs \
  --min-age "$MIN_AGE_FOR_LOCAL_DELETE" \
  --exclude ".obsidian/" \
  --exclude "$BACKUP_FOLDER/**" \
  --backup-dir "$LOCAL_BACKUP" \
  --log-file="$LOG_FILE" \
  --verbose \
#  --dry-run

# Push changes from local to remote.
rclone sync  "$LOCAL" "$REMOTE" \
  --fast-list \
  --update \
  --create-empty-src-dirs \
  --exclude ".obsidian/" \
  --exclude "$BACKUP_FOLDER/**" \
  --backup-dir "$REMOTE_BACKUP" \
  --log-file="$LOG_FILE" \
  --verbose \
#  --dry-run


