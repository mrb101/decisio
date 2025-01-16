# Use an official Python runtime as a base image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install uv and other essential tools
RUN pip install --upgrade pip uv setuptools wheel

# Copy the project files into the container
COPY . .

# Create a virtual environment
RUN uv venv

# Install the package and dependencies using uv
RUN uv pip install -e .
