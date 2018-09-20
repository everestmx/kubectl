FROM alpine

LABEL maintainer="NEO Dev <everestmx@gmail.com>"

ENV KUBE_CONFIG=""
ENV KUBE_VERSION="v1.11.3"

# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN set -x && \
    apk add --no-cache curl ca-certificates bash && \
    chmod +x /usr/local/bin/kubectl && \
    kubectl version --client

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]