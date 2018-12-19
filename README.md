# kustomizer
A container for running k8s kustomize.

## Usage
mount a kustomizable directory to /kustomize and run kustomize within the image.

example: `docker run -it -v "/path/to/local/dir":/kustomize lyft/kustomize:SHA kustomize build overlays/staging`

## Updating

To update the image to a new version of kustomize, change the version number specified in the Dockerfile, and update the sha256 value using the value from ``shasums.txt`` for your release: https://github.com/kubernetes-sigs/kustomize/releases
