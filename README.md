# WordPress Docker Starter

A modern Docker-based WordPress stack designed for easy local development and production deployment.

## Features

- **Easy Local Development**: Works on Mac, Windows, and Linux.
- **Identical Production Deployment**: Use the same setup on your VPS.
- **Clean Separation**: Code and data are cleanly separated.
- **Version Control**: Only commit themes, plugins, and configuration.

## Architecture

- **wordpress**: Apache + PHP + WordPress
- **db**: MySQL 8.0
- **adminer**: Database management tool
- Local access: [http://localhost:8000](http://localhost:8000) (WordPress) and [http://localhost:8081](http://localhost:8081) (Adminer)

## Prerequisites

- Docker
- Docker Compose

## Setup

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd wordpress-docker-starter
   ```

2. **Start the containers**:
   ```bash
   docker compose up -d
   ```

3. **Access WordPress**:
   - Open [http://localhost:8000](http://localhost:8000) in your browser.
   - Follow the WordPress installation wizard.

4. **Access Adminer**:
   - Open [http://localhost:8081](http://localhost:8081) in your browser.
   - Log in with:
     - System: MySQL
     - Server: db
     - Username: wordpress
     - Password: wordpress
     - Database: wordpress

## Project Structure

```
wordpress-docker-starter/
├── .gitignore
├── docker-compose.yml
├── .env.example
├── config/
│   ├── php/
│   │   └── php.ini
│   └── mysql/
│       └── my.cnf
├── scripts/
│   └── backup.sh
├── db_data/
├── backups/
├── logs/
├── wordpress/
│   └── wp-content/
└── README.md
```

## Volumes

- `./wordpress` is mounted to `/var/www/html` in the WordPress container. Any changes to themes or plugins are live.
- `./db_data` holds MySQL data and persists across container restarts.

## Development Workflow

- **Start containers**:
  ```bash
  docker compose up -d
  ```

- **Stop containers**:
  ```bash
  docker compose down
  ```

- **View running containers**:
  ```bash
  docker compose ps
  ```

## Backup

Run the backup script to backup WordPress files and the database:
```bash
./scripts/backup.sh
```

## What to Commit

- ✅ **Commit**:
  - `docker-compose.yml`
  - `.gitignore`
  - `README.md`
  - Custom themes (`wordpress/wp-content/themes/my-theme/`)
  - Custom plugins (`wordpress/wp-content/plugins/my-plugin/`)

- 🚫 **Do not commit**:
  - `db_data/`
  - `wordpress/wp-content/uploads/` (optional)
  - `wordpress/wp-config.php` (if sensitive)

## Production Deployment

1. Use the same `docker-compose.yml` on your VPS.
2. Map port 80:80 on your VPS.
3. Point your domain to the VPS IP.
4. (Optional) Add HTTPS with a reverse proxy like Nginx or Caddy.

## Future Improvements

- Add automated HTTPS configuration (Caddyfile or Nginx config).
- Add automatic database backup scripts.
- Create GitHub Actions CI/CD pipeline for build and deployment.

## Notes

- This project is intentionally simple and opinionated—no extra dependencies.
- Safe for both beginners and advanced developers. 