FROM alpine:latest
RUN apk add curl && curl -L --output /usr/local/bin/kustomize https://github.com/kubernetes-sigs/kustomize/releases/download/v1.0.11/kustomize_1.0.11_linux_amd64 \
  && echo "2b21b44f0245ac774f0b35e5181fd8ad7fc42a9426bc0bbfe82a75bea286b48b  /usr/local/bin/kustomize" | sha256sum -c \
  && chmod +x /usr/local/bin/kustomize
RUN chmod +x /usr/local/bin/kustomize
WORKDIR /kustomize
