# Tiago's AMPP stack - Apache, PHP, MatiaDB and PhpMyAdmin with SSL

This is my working AMPP stack. It's running out of the box with no initial configuration at all, but of course you might need to adjust to your needs.

## 🚀 Features

- SSL pre-configured (you need to change the certificates)
- PhpMyAdmin secured via reverse proxy
- Certbot pre-configured
- Multiple domains support, ideal for VPS

## 🚀 Files

ampp/
│
├── apache-php/
│   ├── certs/
│   │   ├── mydomain.crt
│   │   ├── mydomain.key
│   │   ├── my-vps-root.net.crt
│   │   └── my-vps-root.net.key
│   ├── hosts/
│   │   ├── 000-default.conf
│   │   ├── default-ssl.conf
│   │   ├── mydomain.com.conf
│   │   └── mydomain.com-ssl.conf
│   ├── logs/
│	│   └── <apache logs>
│	├── Dockerfile
│	├── php.ini
│	└── apache2.conf
├── mariadb/
│   ├── data/
│   │   └── ...
│	└── change-root-pass.sh
├── phpmyadmin/
│	└── config.user.inc.php
├── www/
│   ├── mydomain.com/
│   │   └── index.html
│   └── index.html
└── docker-compose.yml


## 📦 Installation

Clone the repository and run:

```bash
docker compose up -d

