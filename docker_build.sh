set -e

if [ -n "$REGISTRY" ]; then
  # Do not push if there are unstaged git changes
  CHANGED=$(git status --porcelain)
  if [ -n "$CHANGED" ]; then
    echo "Please commit git changes before pushing to a registry"
    exit 1
  fi
fi

docker build -t "$IMAGE_NAME:latest" .

if [ -n "$REGISTRY" ]; then

  SHA=$(git rev-parse HEAD)

  IMAGE_TAG="${REGISTRY}/${IMAGE_NAME}:${SHA}"

  docker tag "${IMAGE_NAME}:latest" "$IMAGE_TAG"

  if [ -n "${DOCKER_REGISTRY_PASSWORD}" ]; then
    docker login --username=${DOCKER_REGISTRY_USERNAME} --password=${DOCKER_REGISTRY_PASSWORD}
  fi

  docker push "$IMAGE_TAG"

fi

echo ""
echo "------------------------------------"
echo "              SUCCESS"
echo "------------------------------------"
echo ""

echo "$IMAGE_NAME:latest built locally."

if [ -n "$REGISTRY" ]; then
  echo "${IMAGE_TAG} pushed to remote."
fi
echo ""
