#!/bin/bash

# Set variables
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="./backups"
WP_DIR="./wordpress"
DB_CONTAINER="wordpress-docker-starter_db_1"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup WordPress files
echo "Backing up WordPress files..."
tar -czf "$BACKUP_DIR/wp_files_$TIMESTAMP.tar.gz" "$WP_DIR"

# Backup database
echo "Backing up database..."
docker exec "$DB_CONTAINER" mysqldump -u wordpress -pwordpress wordpress > "$BACKUP_DIR/wp_db_$TIMESTAMP.sql"

# Compress database backup
gzip "$BACKUP_DIR/wp_db_$TIMESTAMP.sql"

echo "Backup completed:"
echo "- Files: $BACKUP_DIR/wp_files_$TIMESTAMP.tar.gz"
echo "- Database: $BACKUP_DIR/wp_db_$TIMESTAMP.sql.gz" 