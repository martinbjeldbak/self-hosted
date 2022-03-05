FROM huginn/huginn:latest

USER root

RUN apt-get update && \
    apt-get install -y netbase whois

USER 1001
