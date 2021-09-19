# My Home Assistant Configuration
![Home Assistant configuration check status](https://github.com/martinbjeldbak/home-assistant-config/workflows/Check%20Home%20Assistant%20configuration/badge.svg)

This repository contains a backup of my Home Assistant configuration.

Home assistant is installed via [hass.io](https://www.home-assistant.io/hassio/) on a Raspberry Pi 3 Model B connected to my home network.

## Home Assitant Integrations

I have the following integrations set up via the UI

* AdGuard Home
* Apple TV (from HACS, see below)
* HTTPS Certificate Expiry
* Philips Hue
* Apple iCloud
* Met.no
* Plex
* Spotify
* Transmission

## Home Assistant Custom Components

I am also using [HACS](https://hacs.xyz) for improved Apple TV support, among other addons.

## Hass.io Addons

On the hass.io superviser side of things, I have the following add-ons installed via the UI

* AdGuard Home, configured with many blocklists
* Terminal & SSH
* CEC Scanner

Everything is backed up via the hass.io snapshot feature.
