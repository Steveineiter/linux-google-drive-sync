#!/bin/bash
readonly RSYNC_CONFIG="google_drive"
readonly LOCAL_DESTINATION="$HOME/GoogleDrive"
# To try it out:
# rclone sync --dry-run "$RSYNC_CONFIG":/ "$LOCAL_DESTINATION" --log-file=$HOME/.config/rclone/rclone.log --verbose
# To solve cache error:
# rclone bisync "$RSYNC_CONFIG":/ "$LOCAL_DESTINATION" --log-file=$HOME/.config/rclone/rclone.log --verbose --resync

rclone bisync "$RSYNC_CONFIG":/ "$LOCAL_DESTINATION" --log-file=$HOME/.config/rclone/rclone.log --verbose
