FROM caddy:2.9.1-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http

FROM caddy:2.9.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
