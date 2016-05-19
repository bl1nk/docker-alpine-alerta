#!/bin/bash

cat >/alerta.conf << EOF
[DEFAULT]
timezone = Etc/UTC
output = json
profile = production

EOF
