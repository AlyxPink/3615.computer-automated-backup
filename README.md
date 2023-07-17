# Automated backup for Fly.io PostgreSQL w/ Restic

This repository is backing up a PostgreSQL database to CloudFlare R2 using Restic.

## Environment variables

```
AWS_ACCESS_KEY_ID=xxx
AWS_SECRET_ACCESS_KEY=xxx

RESTIC_PASSWORD=xxx
RESTIC_REPOSITORY=xxx

BACKUP_PREFIX=xxx
BACKUP_DIRECTORY=/var/backups
DATABASE_URL=postgres://db_name:password@instance_address.flycast:5432/db_name?sslmode=disable
```
