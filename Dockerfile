FROM traefik:camembert
MAINTAINER Haukur Kristinsson
ADD traefik.toml .
EXPOSE 80
EXPOSE 8080
EXPOSE 443
