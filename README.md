# Service Proxy for Containers

This repository represents a base for service proxy container that can serve services that are running in containers (not swarm or kubernetes, but it is possible). It uses by default 

To start using it:

  - Have ``Docker`` and ``docker-compose`` up and running.
  - Make sure default domain is yours in ``traefik.toml``
  - Make sure your email is registered with letsencrypt.
  - bring up with ``docker-compose up -d``

# How should I configure my services?

Demo with docker-compose:
```
  api:
      build: ./src/Api
      container_name: test-api
      volumes:
        - /app/node_modules/
      ports:
        - "5004:5004"
      environment:
        - IDENTITY_HOST
      labels:
        - "traefik.port=5004"
        - "traefik.enable=true"
        - "traefik.backend=test-api"
        - "traefik.frontend.rule=Host:test-api.hauxi.is"
        - "traefik.docker.network=service-proxy"
      networks:
        - default
        - service-proxy
```
If you need more info read the docs from ``docker-compose`` and ``træfik``.

