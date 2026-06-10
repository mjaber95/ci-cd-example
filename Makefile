PROJECT := hip-voyager-421200
IMAGE := test-app
REGION := europe-west1
DOCKER_REPO_NAME := my-docker-repo
TAG := 0.1

IMAGE_URI := $(REGION)-docker.pkg.dev/$(PROJECT)/$(DOCKER_REPO_NAME)/$(IMAGE):$(TAG)

default: pylint pytest

pylint:
	find . -iname "*.py" -not -path "./tests/*" | xargs -n1 -I {} pylint --output-format=colorized {}; true

pytest:
	PYTHONDONTWRITEBYTECODE=1 pytest -v --color=yes

print-image:
	@echo $(IMAGE_URI)
