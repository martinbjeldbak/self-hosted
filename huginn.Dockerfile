FROM huginn/huginn:6bf00318b0a38651133ff95728105f4d844aa49c

USER root

RUN apt-get update && \
    apt-get install -y netbase whois

USER 1001
