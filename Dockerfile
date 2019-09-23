FROM alpine:latest
RUN apk add curl git openssh \
  && git config --global url.ssh://git@github.com/.insteadOf https://github.com/ \
  && curl -L --output /usr/local/bin/kustomize https://github.com/kubernetes-sigs/kustomize/releases/download/v3.1.0/kustomize_3.1.0_linux_amd64 \
  && echo "73acc575cf4e035a91da63ecffcabe58f9572562b772c1eb7ed863991950afe8  /usr/local/bin/kustomize" | sha256sum -c \
  && chmod +x /usr/local/bin/kustomize
WORKDIR /kustomize
