# Recovery runbook

Step-by-step guide to fully restore this server from scratch.
Estimated time: ~20 minutes.

## Prerequisites
- AWS account access
- This repository cloned locally
- SSH key pair for the instance
- Secrets stored in AWS Secrets Manager (or your secret store of choice)

## Steps

### 1. Provision a new EC2 instance
```bash
cd terraform
terraform init
terraform apply
```
Note the `public_ip` from the output.

### 2. SSH into the new instance
```bash
ssh -i ~/.ssh/my-key.pem ubuntu@<public_ip>
```

### 3. Clone this repo on the instance
```bash
git clone https://github.com/YOUR_USERNAME/ec2-revival-kit.git
cd ec2-revival-kit
```

### 4. Retrieve secrets
Fetch your `.env` file from AWS Secrets Manager (or wherever stored) and place it at:
```
/home/ubuntu/app/.env
```

### 5. Run the bootstrap script
```bash
bash scripts/bootstrap.sh
```

### 6. Deploy your application
```bash
# TODO: add your deployment steps here (git pull, npm install, etc.)
```

### 7. Verify everything is healthy
```bash
bash scripts/health-check.sh
```

### 8. Update DNS
Point your domain's A record to the new `public_ip`.

---
## Rollback
If something goes wrong, re-run `terraform destroy` and start from step 1.
