# 🐳 Laravel Docker Development Environment

[![PHP Version](https://img.shields.io/badge/PHP-8.5-777bb4?style=flat-square&logo=php)](https://www.php.net/)
[![Docker](https://img.shields.io/badge/Docker-Enabled-2496ed?style=flat-square&logo=docker)](https://www.docker.com/)
[![Laravel](https://img.shields.io/badge/Laravel-11.x-ff2d20?style=flat-square&logo=laravel)](https://laravel.com/)

A modern and optimized Docker environment for developing robust APIs with **Laravel**, focused on performance, scalability, and best practices.

---

## 🚀 Integrated Technologies

- **PHP 8.5** (FPM) - Latest version with JIT support and performance improvements.
- **NGINX (latest stable version)** - High-performance web server.
- **MySQL (latest stable version)** - Stable relational database.
- **Redis (latest stable version)** - Cache, queues, and session management.
- **Docker Compose** - Simplified container orchestration.

---

## 📁 Container Architecture

The environment consists of 6 isolated services to ensure maximum efficiency:

| Container | Service | Description |
| :--- | :--- | :--- |
| `laravel_app` | PHP-FPM | Laravel application core |
| `laravel_nginx` | Web Server | Entry point (HTTP/80) |
| `laravel_mysql` | Database | Data storage |
| `laravel_redis` | Redis | Cache and Queue Backend |
| `laravel_queue` | Worker | Background job processing |
| `laravel_scheduler` | Cron | Scheduled task execution |

---

## 🛠️ Prerequisites

Make sure you have installed on your machine:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

---

## 📥 Installation and Setup

Follow the steps below to configure the environment:

### 1. Clone the repository
```bash
git clone https://github.com/carlosbelchior/docker.git
cd docker
```

### 2. Configure environment variables
Create a `.env` file in the project root based on the example below:

```env
# Docker Configurations (User Permissions)
DOCKER_USER=www
DOCKER_UID=1000
DOCKER_GID=1000

# Database Configurations
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=admin
DB_ROOT_PASSWORD=admin
```
> **Note:** Use `id -u` and `id -g` on Linux to find your UID and GID to avoid permission issues with volumes.

### 3. Start the containers
```bash
docker compose up -d --build
```

---

## ⌨️ Useful Commands

| Action | Command |
| :--- | :--- |
| **Access Terminal (PHP)** | `docker-compose exec app bash` |
| **View Logs** | `docker-compose logs -f` |
| **Stop Containers** | `docker-compose stop` |
| **Remove Containers** | `docker-compose down` |
| **Run Migrations** | `docker-compose exec app php artisan migrate` |
| **Install Dependencies** | `docker-compose exec app composer install` |

---

## 🌐 Application Access

- **App:** [http://localhost](http://localhost)
- **Database Host:** `mysql` (internal) / `127.0.0.1:3306` (external)
- **Redis Host:** `redis` (internal)

---

## 🧠 Included Best Practices

- **Security:** Containers do not run as root (dedicated `www` user).
- **Scalability:** Separate Workers and Scheduler to avoid impacting API performance.
- **Persistence:** Volumes configured for MySQL and Logs.
- **Ready for API:** Configured for decoupled architectures (Nuxt.js, Next.js, Mobile).

---

## 📌 Suggested Next Steps

- [ ] Implement **Laravel Sanctum** for authentication.
- [ ] Configure **Laravel Horizon** for queue monitoring.
- [ ] Integrate **S3 / MinIO** for file uploads.
- [ ] Configure **CI/CD** pipelines (GitHub Actions).

---
Developed with ❤️ for the Laravel community.