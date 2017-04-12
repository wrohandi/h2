FROM java:8

# Forked from:
# https://hub.docker.com/r/oscarfonts/h2/

MAINTAINER Wira Rohandi <wira@rohandi.com>

ENV DOWNLOAD http://www.h2database.com/h2-2016-10-31.zip
ENV DATA_DIR /opt/h2-data

RUN curl ${DOWNLOAD} -o h2.zip \
    && unzip h2.zip -d /opt/ \
    && rm h2.zip \
    && mkdir -p ${DATA_DIR}

EXPOSE 80 9092

CMD java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server \
 	-web -webAllowOthers -webPort 80 \
 	-tcp -tcpAllowOthers -tcpPort 9092 \
 	-baseDir ${DATA_DIR}
