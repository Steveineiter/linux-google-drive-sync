# google-drive-sync

1. Install and go over https://rclone.org/drive/ aka simply the configuration. **Recommended** to use a own client id (https://rclone.org/drive/#making-your-own-client-id) else we run into rate limits all the time.
2. Test setup with `rclone lsd CONFIG_NAME:`
3. Dry run if sync works `rclone sync --dry-run CONFIG_NAME:/ $HOME/FOLDER_NAME`
4. Syncing content: `rclone sync  CONFIG_NAME:/ $HOME/FOLDER_NAME -P`. -P for progress flag.
5. Move the scripts to home/USERNAME/bin and chomd +x.
6. Add into `~/.bashrc` `alias pull="./$HOME/bin/google_drive_pull.sh" alias push="./$HOME/bin/google_drive_push.sh"`. Then `source ~/.bashrc` This is a manual approach, since its quite hard to make it work as google drive works xD
7. In `crontab -e` add `@reboot  $HOME/bin/google_drive_startup.sh` this will sync remote onto local. Don't forget to push after a work session xD.

- Use `cat $HOME/.config/rclone/rclone.log` per default to see log.

# TODO add filer file

to speed things up xD since here i will mainly be in Career and Learning. Or make scripts with full eg ...pull_full alias.
