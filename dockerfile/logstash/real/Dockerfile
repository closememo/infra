FROM docker.elastic.co/logstash/logstash:7.17.3

USER root

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata
ENV TZ=Asia/Seoul

USER logstash

COPY --chown=root:logstash config/logstash.yml /usr/share/logstash/config/logstash.yml
COPY --chown=root:logstash pipeline/logstash.conf /usr/share/logstash/pipeline/logstash.conf
