# Martin's Self-hosting setup
[![Lint](https://github.com/martinbjeldbak/self-hosting/actions/workflows/lint.yml/badge.svg)](https://github.com/martinbjeldbak/self-hosting/actions/workflows/lint.yml)

Inspired by Ben Balter's [blog](https://ben.balter.com/2020/12/04/over-engineered-home-network-for-privacy-and-security/) [posts](https://ben.balter.com/2021/09/01/how-i-re-over-engineered-my-home-network/) and his repository [benbalter/pi-hole-cloudflared-docker-compose-ansible-caddy](https://github.com/benbalter/pi-hole-cloudflared-docker-compose-ansible-caddy) and <https://github.com/sebgl/htpc-download-box>

```mermaid
flowchart TB
    subgraph HTPC/Download Server
    subgraph *arrs
    direction TB
    S[Sonarr]
    R[Radarr]
    end
    *arrs-->J

    *arrs-->TM[Transmission]
    TM-->O[OpenVPN Client]
    TM-.->D[Download\ndirectory]
    D<-.->L[Library\ndirectory]
    P[Plex Media\nServer]-->L
    *arrs-.-> L & D
    PTS[plextraktsync]-->P
    PMM[plex-meta-manager]-->P
    TAUT[Tautulli]-->P
    BARR[Bazarr]-->*arrs
    U[Unpackerr]-->*arrs
    end

    J[Jackett]-->T[Torrent\nindexers]
    O-->V[VPN Server]
    V-->B[Bittorrent\nPeers]

    subgraph media metadata
    PTS-->TR[Trakt.tv]
    PMM-->TR
    PMM-->RT[Rotten\nTomatoes]
    PMM-->IMDB[IMDb]
    PMM-->*arrs
    PMM-->TMDB[tMDB]
    end

    subgraph subtitle providers
    BARR-->OS[Opensubtitles]
    BARR-->addic7ed
    BARR-->subscene
    BARR-->podnapisi
    end

    subgraph other
    AH[AdGuard\nHome]
    H[Huginn]
    HA[Home\nAssistant]
    C[Caddy]
    W[Watchtower]
    PG[Postgres]

    H-->PG
    end

    W-->DISCORD[Discord]

    C-->AH
    C-->HA
    C-->P
    C-->J
    C-->R
    C-->S
    C-->TM
    C-->BARR
    C-->H
    C-->TAUT

    linkStyle 3,4,5,6,7 stroke:blue;
    classDef internet stroke:#f66;
    classDef folder stroke:blue,fill:none,stroke-dasharray: 5 5;
    class L,D folder
    class T,V,B,TR,RT,IMDB,OS,addic7ed,subscene,podnapisi,DISCORD,TMDB internet
```

* [Portainer](https://github.com/portainer/portainer) - UI to help manage containers
* [Adguard Home](https://github.com/AdguardTeam/AdGuardHome) - self-hosted DNS server with ad-blocking
* [Plex Media Server](https://www.plex.tv) - connects to my Synology NAS and hosts database
* [Home Assistant](https://www.home-assistant.io) - integrates all my IoT devices
* [Transmission](https://transmissionbt.com) - torrent client used by Radarr and Sonarr to fetch media
* [Radarr](https://radarr.video) - monitor & download movies
* [Sonarr](https://sonarr.tv) - monitor & download TV shows
* [Jackett](https://github.com/Jackett/Jackett) - proxy supporting private torrent tracker integration with Radarr & Sonarr
* [Caddy](https://caddyserver.com) - HTTPS support with Let's Encrypt
* [Bazarr](https://github.com/morpheus65535/bazarr) - fetch subtitles for Sonarr and Radarr

all of these services are managed via docker using docker-compose.
