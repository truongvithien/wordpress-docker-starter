#!/bin/bash

# WordPress Docker Starter - Setup Script
# This script automates the initial setup process.

set -e

# 1. Copy .env.example to .env if not present
if [ ! -f .env ]; then
  echo "Copying .env.example to .env..."
  cp .env.example .env
else
  echo ".env already exists. Skipping copy."
fi

# 2. Create required directories
for dir in db_data backups logs wordpress/wp-content; do
  if [ ! -d "$dir" ]; then
    echo "Creating directory: $dir"
    mkdir -p "$dir"
  fi
done

# 3. Set permissions for scripts
chmod +x scripts/*.sh

echo "Setup complete!"
echo "You can now run: docker compose up -d" 