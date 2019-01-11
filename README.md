# kustomizer
A container for running the k8s [kustomize](https://github.com/kubernetes-sigs/kustomize) tool.

## Usage

mount a directory into the container at `/kustomize` and run kustomize within the image.

example: `docker run -it -v /path/to/my/dir:/kustomize lyft/kustomize:v1.0.11 kustomize build overlays/staging`

this will run the kustomization `/path/to/my/dir/overlays/staging/kustomization.yaml`

The kustomizer docker images are tagged with the semver of the kustomize version used inside the image.

The output will be piped to stdout. From there, you can redirect it to a file or the ``kubectl apply`` command.

## Developing this image

To update the image to a new version of kustomize, change the version number specified in the Dockerfile, and update the sha256 value using the value from ``shasums.txt`` for your release: https://github.com/kubernetes-sigs/kustomize/releases
