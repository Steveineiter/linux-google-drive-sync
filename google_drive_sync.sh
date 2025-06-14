#!/bin/bash
readonly RCLONE_CONFIG="google_drive"
readonly LOCAL_DESTINATION="$HOME/GoogleDrive"

do_resync=false
if [[ "$1" == true ]]; then
  flag=true
fi

# To try it out:
# rclone sync --dry-run "$RSYNC_CONFIG":/ "$LOCAL_DESTINATION" --log-file=$HOME/.config/rclone/rclone.log --verbose
# To solve cache error:
# rclone bisync "$RSYNC_CONFIG":/ "$LOCAL_DESTINATION" --log-file=$HOME/.config/rclone/rclone.log --verbose --resync --drive-acknowledge-abuse

# Copy cloud stuff into local first.
if $flag; then
  rclone bisync  "$LOCAL_DESTINATION" "$RCLONE_CONFIG":/ --log-file=$HOME/.config/rclone/rclone.log --verbose --fast-list --resync
else
  rclone bisync "$LOCAL_DESTINATION" "$RCLONE_CONFIG" --log-file=$HOME/.config/rclone/rclone.log --verbose --fast-list
fi

