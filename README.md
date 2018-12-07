# kustomizer
A container for running k8s kustomize

## Usage
mount a kustomizable directory to /kustomize and run kustomize within the image.

example: `docker run -it -v "/path/to/local/dir":/kustomize lyft/kustomize:SHA kustomize build overlays/staging`

