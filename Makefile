# Variables
IMAGE_NAME = decisio
TAG = latest

# Declare that these targets are not associated with files
.PHONY: build run test clean format

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME):$(TAG) .

# Run the Docker container
run:
	docker run --rm $(IMAGE_NAME):$(TAG)

# Run tests inside the Docker container using uv
test:
	docker run --rm $(IMAGE_NAME):$(TAG) uv run pytest

# Clean up dangling images and containers
clean:
	docker system prune -f

# Run Ruff formater inside the Docker container
format:
	docker run --rm $(IMAGE_NAME):$(TAG) uv run ruff format
