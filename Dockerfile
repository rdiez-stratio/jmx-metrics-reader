FROM qa.stratio.com/stratio/ubuntu-base:16.04

ARG VERSION

RUN wget http://central.maven.org/maven2/org/jmxtrans/jmxtrans/259/jmxtrans-259-all.jar && \
    wget -q https://raw.githubusercontent.com/jmxtrans/jmxtrans/master/jmxtrans/jmxtrans.sh && \
    chmod +x jmxtrans.sh

ADD docker/docker-entrypoint.sh .
ADD docker/jvm_influx.json .
ADD docker/jvm_file.json .

ENTRYPOINT ["./docker-entrypoint.sh"]
