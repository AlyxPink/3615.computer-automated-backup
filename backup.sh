#!/usr/bin/env ash

# Define the database name and backup directory
backup_prefix=$BACKUP_PREFIX
backup_directory=$BACKUP_DIRECTORY

# Generate the timestamp in the format YYYY-MM-DD_HH-MM-SS
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Construct the backup filename
filename="${backup_prefix}_backup_${timestamp}.sql"

# Create the backup directory
mkdir -p $backup_directory

# Specify the full path of the backup file
backup_file="${backup_directory}/${filename}"

# Print the generated filename
echo "Backup filename: ${filename}"

# Run the pg_dump command to create the backup
echo "Dumping database to ${backup_file}..."
pg_dump -Fc $DATABASE_URL -f "${backup_file}"

# Remove any locks
restic unlock

# Run restic to upload our backup
echo "Uploading ${backup_file} to $RESTIC_REPOSITORY..."
restic -r $RESTIC_REPOSITORY --verbose backup $BACKUP_DIRECTORY

# Purge old backups according to our policy
#
#   keep all 50 most recent snapshots
#   keep all hourly snapshots made within 48 hours
#   keep all daily snapshots made within 30 days
#   keep all weekly snapshots made within 3 month
#   keep all monthly snapshots made within 2 year
#   keep all yearly snapshots made within 10 years
echo "Apply retention policy by deleting old snapshots..."
restic forget --prune --keep-last 50 --keep-within-hourly 48h --keep-within-daily 30d --keep-within-weekly 3m --keep-within-monthly 2y --keep-within-yearly 10y
