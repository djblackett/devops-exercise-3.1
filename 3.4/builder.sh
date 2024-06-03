#!/usr/bin/env sh


# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <GitHub repository> <Docker Hub repository>"
    exit 1
fi

# Assign arguments to variables
GITHUB_REPO=$1
DOCKERHUB_REPO=$2

# Get repo name (i.e, remove username from GITHUB_REPO)
REPO_NAME=$(basename "$GITHUB_REPO")

echo "Cloning $GITHUB_REPO"
if ! git clone "https://github.com/$GITHUB_REPO.git"
 then
    echo "Failed to clone the repository."
    exit 1
fi

cd "$REPO_NAME" || exit

echo "Building the Docker image..."
if ! docker build -t "$DOCKERHUB_REPO" .
  then
    echo "Failed to build the Docker image."
    exit 1
fi


echo "Logging in to Docker Hub..."
echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin
if [ $? -ne 0 ]
  then
    echo "Failed to log in to Docker Hub."
    exit 1
fi

echo "Pushing the Docker image to Docker Hub..."
if ! docker push "$DOCKERHUB_REPO"
  then
    echo "Failed to push the Docker image."
    exit 1
fi

echo "Docker image successfully pushed to $DOCKERHUB_REPO."
cd ..
rm -rf "$REPO_NAME"
echo "Cleanup completed."