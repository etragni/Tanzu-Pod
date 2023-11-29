FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
ENV TANZU_CLI_VERSION=v1.6.1
# See https://github.com/vmware-tanzu/tanzu-cli/releases
ENV TANZU_CLI_BUNLDE=tanzu-cli-linux-arm64-unstable.tar.gz
ENV TANZU_CLI_CEIP_OPT_IN_PROMPT_ANSWER=no
ENV KUBECTL_VERSION=v1.28.4
WORKDIR /tmp
ADD https://github.com/vmware-tanzu/tanzu-cli/releases/download/$TANZU_CLI_VERSION/$TANZU_CLI_BUNLDE .
RUN apt-get update && \
    apt-get install -y tini perl curl jq && \
    tar -xf tanzu-cli-*-*.tar.gz && \
    install -m755 $TANZU_CLI_VERSION/tanzu-cli* /usr/local/bin/tanzu && \
    curl -fsSL https://carvel.dev/install.sh | bash && \
    curl -fsSJOL https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
    install -m755 kubectl /usr/local/bin/kubectl && \
    rm -rf -- /var/lib/apt/lists/* /tmp/*
RUN tanzu config eula accept && tanzu init
STOPSIGNAL SIGQUIT
ENTRYPOINT ["tini", "--", "sleep", "infinity"]
