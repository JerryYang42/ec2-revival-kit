# ec2-revival-kit

Disaster recovery and configuration snapshot for my AWS EC2 free tier instance.

> If this instance vanishes right now, this repo is everything needed to rebuild it.

## Structure

| Path | Purpose |
|------|---------|
| `terraform/` | Infrastructure as code — recreate the EC2 instance |
| `config/` | nginx, systemd services, crontab, dotfiles |
| `setup/` | Package list and Ansible playbook |
| `scripts/` | bootstrap, backup, and health-check scripts |
| `docs/` | Recovery runbook, architecture notes, common operations |
| `.env.example` | All required environment variables (no secrets) |

## Recovering from scratch

See [docs/RECOVERY.md](docs/RECOVERY.md) for the full step-by-step guide.

Short version:
```bash
cd terraform && terraform apply   # 1. provision instance
bash scripts/bootstrap.sh         # 2. configure it
bash scripts/health-check.sh      # 3. verify
```

## Secrets

Real secrets are **never stored here**. See `.env.example` for the list of
required variables and retrieve values from AWS Secrets Manager.
