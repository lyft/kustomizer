FROM alpine:latest
RUN apk add curl && curl -L --output /usr/local/bin/kustomize https://github.com/kubernetes-sigs/kustomize/releases/download/v1.0.11/kustomize_1.0.11_linux_amd64 && chmod +x /usr/local/bin/kustomize
RUN chmod +x /usr/local/bin/kustomize
WORKDIR /kustomize
