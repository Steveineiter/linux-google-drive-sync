# google-drive-sync

1. Install and go over https://rclone.org/drive/ aka simply the configuration. **Recommended** to use a own client id (https://rclone.org/drive/#making-your-own-client-id) else we run into rate limits all the time.
2. Test setup with `rclone lsd CONFIG_NAME:`
3. Dry run if sync works `rclone sync --dry-run CONFIG_NAME:/ $HOME/FOLDER_NAME`
4. Syncing content: `rclone sync  CONFIG_NAME:/ $HOME/FOLDER_NAME -P`. -P for progress flag.
5. Move this script to home/USERNAME/bin
6. Create a Systemd Service with the script of this repo.
   - Run it firstl manually, maybe it will have an error message about caches, then run with --resync flag (see the script)

- `sudo vim /etc/systemd/system/rclone-sync.service`
- And type the following:

```
[Unit]
Description=Rclone Sync Service
After=network-online.target

[Service]
Type=simple
ExecStart=/home/USERNAME/bin/rclone_sync.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

7. Also create a timer file to run it all 10 minutes or so

- `sudo vim /etc/systemd/system/rclone-sync.timer`

```
[Unit]
Description=Run Rclone Sync Service every 10 minutes

[Timer]
OnUnitActiveSec=10min  # Run every 10 minutes
Unit=rclone_sync.service

[Install]
WantedBy=timers.target
```

8. Reload and enable service:

- Give both servies chmod +x

```
sudo systemctl daemon-reload
sudo systemctl enable rclone-sync.timer
sudo systemctl start rclone-sync.timer
```

- Check service status

```
systemctl list-timers --all
```
