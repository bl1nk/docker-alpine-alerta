FROM python:2.7.11-alpine
MAINTAINER Sebastian Herzberg <s.herzberg@mytaxi.com>

RUN apk add --no-cache git libffi-dev nginx wget bash
RUN apk --update add --virtual build-dependencies python-dev build-base

RUN pip install alerta-server alerta redis dnspython
RUN pip install gunicorn supervisor

RUN wget -q -O - https://github.com/alerta/angular-alerta-webui/tarball/master | tar zxf -
RUN mv alerta-angular-alerta-webui-*/app /app

RUN apk del build-dependencies

ENV ALERTA_SVR_CONF_FILE /alertad.conf
ENV ALERTA_CONF_FILE /alerta.conf
ENV ALERTA_DEFAULT_PROFILE production
ENV BASE_URL /api

ADD config.js.sh /config.js.sh
ADD alertad.conf.sh /alertad.conf.sh
ADD alerta.conf.sh /alerta.conf.sh
RUN chmod +x /config.js.sh
RUN chmod +x /alertad.conf.sh
RUN chmod +x /alerta.conf.sh
ADD nginx.conf /nginx.conf
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 80
CMD /config.js.sh && /alertad.conf.sh && /alerta.conf.sh && supervisord -n
