# google-drive-sync

1. Install and go over https://rclone.org/drive/ aka simply the configuration.
2. Test setup with `rclone lsd CONFIG_NAME:`
3. Dry run if sync works `rclone sync --dry-run CONFIG_NAME:/ $HOME/FOLDER_NAME`
4. Syncing content: `rclone sync  CONFIG_NAME:/ $HOME/FOLDER_NAME`
5. Create a Systemd Service with the script of this repo.
   - Run it firstl manually, maybe it will have an error message about caches, then run with --resync flag (see the script)

- `sudo vim /etc/systemd/system/rclone-sync.service`
- Add the following:

```
[Unit]
Description=Rclone Sync Service
After=network-online.target

[Service]
Type=simple
ExecStart=/home/your-username/.local/bin/rclone_sync.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

- Reload and enable service:

```
sudo systemctl daemon-reload
sudo systemctl enable rclone-sync.service
sudo systemctl start rclone-sync.service
```

- Check service status

```
sudo systemctl status rclone-sync.service
```
