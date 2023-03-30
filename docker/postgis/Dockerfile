FROM postgres:14

LABEL maintainer="PostGIS Project - https://postgis.net"

ENV POSTGIS_MAJOR 3
ENV POSTGIS_VERSION 3.3.2+dfsg-1.pgdg110+1

RUN apt-get update \
      && apt-cache showpkg postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
      && apt-get install -y --no-install-recommends \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts=$POSTGIS_VERSION \
           postgresql-contrib \
      && rm -rf /var/lib/apt/lists/*

# Set locale to Finnish
RUN localedef -i fi_FI -c -f UTF-8 -A /usr/share/locale/locale.alias fi_FI.UTF-8
ENV LANG fi_FI.utf8

# General PostGIS settings
COPY create_template_postgis.sh /docker-entrypoint-initdb.d/10_template_postgis.sh
# COPY create_template_postgis.sh /docker-entrypoint-initdb.d/10_postgis.sh
COPY create_group_roles.sh /docker-entrypoint-initdb.d/20_gisdb_create_roles.sh

