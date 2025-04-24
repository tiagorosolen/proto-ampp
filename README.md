# The Protoblog's AMPP stack - Apache, PHP, MariaDB and PhpMyAdmin

This is my working AMPP stack. It's running out of the box with no initial configuration at all, but of course you might need to adjust it to your needs.
Only secured requests are accepted. Initial test self-signed certs are provided but please change them before depolying to production!

## 🚀 Features

- SSL pre-configured (you need to change the certificates before deploying)
- PhpMyAdmin secured via reverse proxy
- Running example of multiple domains support, ideal for VPS
- Bonus: script to change MariaDB root password

##  Files

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
│	  │   └── <apache logs>
│	  ├── Dockerfile
│	  ├── php.ini
│	  └── apache2.conf
├── mariadb/
│   ├── data/
│   │   └── ...
│	  └── change-root-pass.sh
├── phpmyadmin/
│	  └── config.user.inc.php
├── www/
│   ├── mydomain.com/
│   │   └── index.html
│   └── index.html
└── docker-compose.yml


## 📦 Installation

Clone the repository and run:

```bash
docker compose up -d
```

## Usage

When running this on your desktop, 3 websites will be immediatly available:

- http://localhost -> what I call my-vps-root
- http://localhost/mydomain.com -> where your stuff should go
- http://localhost/phpmyadmin

Just point your domain to the server and a matching folder (in this case mydomain.com) will be immediatly served.

## Note about security

Regular HTTP is blocked. Please change the certificates on /apache-php/certs or, if you use Certbot, just uncomment letsencrypt path in the host files: mydomain.com-ssl.conf.

```bash
  ## Remote - using Certbot
	#SSLCertificateFile /etc/letsencrypt/live/mydomain.com/fullchain.pem
	#SSLCertificateKeyFile /etc/letsencrypt/live/mydomain.com/privkey.pem

	## Local
	SSLCertificateFile      /etc/ssl/certs/mydomain.com.crt
	SSLCertificateKeyFile   /etc/ssl/certs/mydomain.com.key
```

## Note

Made public by Tiago Rosolen with no strings attached. Hope I helped. 

