FROM ubuntu:18.04

# versions
ARG DEFAULT_VAULT_VER=1.8.2
ARG DEFAULT_SPIRE_VER=1.0.2
ENV VAULT_VER=${DEFAULT_VAULT_VER}
ENV SPIRE_VER=${DEFAULT_SPIRE_VER}

RUN apt update && \
    apt install -y curl && \
    apt install coreutils && \
    apt install -y wget && \
    apt install -y unzip && \
    apt install -y jq && \
    apt install -y vim

# COPY run-sidecar.sh execute-get-token.sh execute-get-vault-secrets.sh \
#    get-vault-secrets.sh /usr/local/bin/

# install Spire agent CLI:
RUN VER=${SPIRE_VER} && \
    wget https://github.com/spiffe/spire/releases/download/v${VER}/spire-${VER}-linux-x86_64-glibc.tar.gz && \
    tar zvxf spire-${VER}-linux-x86_64-glibc.tar.gz && \
    mkdir -p /opt/spire/bin && \
    mv /spire-${VER}/bin/spire-agent /opt/spire/bin/ && \
    rm -rf spire-${VER}/ && \
    rm -f spire-${VER}-linux-x86_64-glibc.tar.gz

# install Vault client CLI:
RUN VER=${VAULT_VER} && \
    wget https://releases.hashicorp.com/vault/${VER}/vault_${VER}_linux_amd64.zip && \
    unzip vault_${VER}_linux_amd64.zip && \
    mv vault /usr/local/bin/ && \
    rm -f vault_${VER}_linux_amd64.zip


# various args to manipulate identity and secrets:
ARG DEFAULT_JWT_TTL_SEC=30
ENV JWT_TTL_SEC=${DEFAULT_JWT_TTL_SEC}
# Default values for vault client setup
ARG DEFAULT_VAULT_ADDR="http://vault:8200"
ARG DEFAULT_SECRET_REFRESH_SEC=600
ARG DEFAULT_IDENTITY_REFRESH_SEC=600
ARG DEFAULT_IS_SIDECAR=true
ENV VAULT_ADDR=${DEFAULT_VAULT_ADDR}
ENV SECRET_REFRESH_SEC=${DEFAULT_SECRET_REFRESH_SEC}
ENV IDENTITY_REFRESH_SEC=${DEFAULT_IDENTITY_REFRESH_SEC}
ENV IS_SIDECAR=${DEFAULT_IS_SIDECAR}


# run it forever
CMD ["/bin/bash", "-c", "tail -f /dev/null"]
