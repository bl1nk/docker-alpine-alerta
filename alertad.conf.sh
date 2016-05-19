#!/bin/bash

cat >/alertad.conf << EOF
DEBUG = True
SECRET_KEY = '$(< /dev/urandom tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+= | head -c 32)'
BASE_URL = '$BASE_URL'

AUTH_REQUIRED = $AUTH_REQUIRED
CUSTOMER_VIEWS = False
OAUTH2_CLIENT_ID = '$CLIENT_ID'
OAUTH2_CLIENT_SECRET = '$CLIENT_SECRET'
ALLOWED_EMAIL_DOMAINS = ['$ALLOWED_EMAIL_DOMAIN']
SMTP_PASSWORD = '$SMTP_PASSWORD'
PLUGINS = []
ADMIN_USERS = ['admin-1@mycompany.com', 'admin-2@mycompany.com']

EOF
