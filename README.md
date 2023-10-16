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

## How to restore the dump?

### Restic

To restore the snapshot:

```
$ restic restore snapshot_id --no-lock --target=/tmp/restored_snapshot
```

### PostgreSQL

On your PostgreSQL server:

```
$ psql -h localhost -U postgres db_name < backup_file.sql
```
