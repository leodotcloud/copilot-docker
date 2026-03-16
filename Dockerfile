FROM ubuntu:24.04

ARG COPILOT_VERSION="latest"
ARG PREFIX="/usr/local"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl ca-certificates sudo gnupg \
  && rm -rf /var/lib/apt/lists/*

# Install Copilot CLI using the official install script. The installer supports VERSION and PREFIX env vars.
RUN curl -fsSL https://gh.io/copilot-install | VERSION="$COPILOT_VERSION" PREFIX="$PREFIX" bash

ENTRYPOINT ["copilot"]

CMD ["--help"]
