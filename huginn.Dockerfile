FROM huginn/huginn:6bf00318b0a38651133ff95728105f4d844aa49c

USER root

RUN apt-get update && \
    apt-get install -y netbase=5.4 whois=5.3.0

USER 1001
