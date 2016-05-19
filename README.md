
docker-alpine-alerta
====================

Alerta monitoring tool for consolidated view of alerts complete with MongoDB linked.

Building
--------

The container as such is not available via Dockerhub. Please build it yourself via:
```
git clone https://github.com/mytaxi/docker-alpine-alerta.git
cd docker-alpine-alerta
docker build --rm -t alpine-alerta .
```

Starting the containers
-----------------------

The repo provides a `docker-compose.yml` file which can be used to start the whole stack.

Configuration
-------------

To allow users to login using Google OAuth, go to the [Google Developer Console][1] and create a new client ID for a web application. Then set the `CLIENT_ID` and `CLIENT_SECRET` environment variables in the `docker-compose.yml`

Also enter one or more admin users in the alertad.conf.sh`

Command-line Tool
-----------------

A command-line tool for alerta is available. To install it run:

    $ pip install alerta

Configuration file `$HOME/.alerta.conf`:

    [DEFAULT]
    endpoint = http://<docker>:<port>/api

If authentication is enabled (ie. `AUTH_REQUIRED` is `True`), then create a new API key in the alerta console and add the key to the configuration file. For example:

    [DEFAULT]
    endpoint = ...
    key = 4nHAAslsGjLQ9P0QxmAlKIapLTSDfEfMDSy8BT+0

Further Reading
---------------

More information about alerta can be found at http://docs.alerta.io

Thank You
---------
Nick Satterly for the [original container][2] 

[1]: <https://console.developers.google.com> "Google Developer Console"
[2]: <https://github.com/alerta/docker-alerta> "Docker Alerta"