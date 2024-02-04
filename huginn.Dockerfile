FROM ghcr.io/huginn/huginn:latest

USER root

# Install extra dependencies to run `whois` and other commands using "Shell Command Agent" type
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C && \
    apt-get update && \
    apt-get install --no-install-recommends -y netbase whois && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER 1001
