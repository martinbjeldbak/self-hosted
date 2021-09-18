# Martin's Raspberry Pi Setup

Inspired by Ben Balter's [blog](https://ben.balter.com/2020/12/04/over-engineered-home-network-for-privacy-and-security/) [posts](https://ben.balter.com/2021/09/01/how-i-re-over-engineered-my-home-network/), I wanted to keep a version controled 

My personal configuration of Raspberry Pi running

* [Adguard Home](https://github.com/AdguardTeam/AdGuardHome) - self-hosted DNS server with ad-blocking
* [Plex Media Server](https://www.plex.tv) - connects to my Synology NAS and hosts database
* [Home Assistant](https://www.home-assistant.io) - integrates all my IoT devices
* [Transmission](https://transmissionbt.com) - torrent client used by Radarr and Sonarr to fetch media
* [Radarr](https://radarr.video) - monitor & download movies
* [Sonarr](https://sonarr.tv) - monitor & download TV shows
* [Jackett](https://github.com/Jackett/Jackett) - proxy supporting private torrent tracker integration with Radarr & Sonarr
* [Caddy](https://caddyserver.com) (TODO) - HTTPS support with Let's Encrypt

all of these services are managed via docker using docker-compose.

## Prerequisites

Ansible installed on control node. See installation guide [here](https://docs.ansible.com/ansible/latest/installation_guide/index.html) or install it via brew if on macOS:

```sh
brew install ansible
```

Install Ansible Galaxy packages

```sh
ansible-galaxy install -r requirements.yml
```

## Usage

1.  Download the [Raspberry Pi Imager](https://www.raspberrypi.org/software/) and flash the latest version of Raspberry Pi OS Lite `brew install raspberry-pi-imager`.
1. Run `ansible-playbook playbook.yml --inventory hosts.yml`
1. Sit back and wait until you have a fully configured PiHole running in about 5-10 minutes

You may need to make some changes in [`hosts.yml`](/hosts.yml) to match the static IP of your Raspberry Pi
