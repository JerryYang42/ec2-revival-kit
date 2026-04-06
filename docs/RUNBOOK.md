# Runbook — common operations

## Restart the app
```bash
sudo systemctl restart app
sudo systemctl status app
```

## Reload nginx
```bash
sudo nginx -t && sudo systemctl reload nginx
```

## View logs
```bash
journalctl -u app -f          # app logs
journalctl -u nginx -f        # nginx logs
tail -f /var/log/backup.log   # backup logs
```

## Renew SSL certificate
```bash
sudo certbot renew --dry-run
sudo certbot renew
```

## Check disk usage
```bash
df -h
du -sh /home/ubuntu/app/*
```

## Manual backup
```bash
bash scripts/backup.sh
```
