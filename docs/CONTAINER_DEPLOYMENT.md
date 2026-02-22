# Container Deployment Guide - ollama-podman

This document covers the deployment of Ollama using Podman containers.

## Prerequisites

- Podman installed (version 4.0+ recommended)
- Rootless Podman configured
- Sufficient disk space for models

## Base Image

```
quay.io/ollama/ollama
```

## Port Configuration

| Service | Container Port | Host Port |
|---------|---------------|-----------|
| granite4 | 11434 | 55077 |
| qwen-coder | 11434 | 66044 |

## Deployment Methods

### Method 1: Direct Podman Run

#### Start granite4 (port 55077)

```bash
podman run -d \
  --name ollama-granite4 \
  -p 55077:11434 \
  -v ollama-granite4:/root/.ollama \
  quay.io/ollama/ollama
```

#### Start qwen-coder (port 66044)

```bash
podman run -d \
  --name ollama-qwen-coder \
  -p 66044:11434 \
  -v ollama-qwen-coder:/root/.ollama \
  quay.io/ollama/ollama
```

### Method 2: Podman Compose

Create a `podman-compose.yml` file:

```yaml
version: "3.8"

services:
  granite4:
    image: quay.io/ollama/ollama
    container_name: ollama-granite4
    ports:
      - "55077:11434"
    volumes:
      - ollama-granite4:/root/.ollama
    restart: unless-stopped

  qwen-coder:
    image: quay.io/ollama/ollama
    container_name: ollama-qwen-coder
    ports:
      - "66044:11434"
    volumes:
      - ollama-qwen-coder:/root/.ollama
    restart: unless-stopped

volumes:
  ollama-granite4:
  ollama-qwen-coder:
```

Run with:
```bash
podman-compose up -d
```

### Method 3: Pods with Shared Resources

```bash
# Create a pod for Ollama services
podman pod create --name ollama-pod -p 55077:11434 -p 66044:11435

# Run containers in the pod
podman run -d --pod ollama-pod \
  --name ollama-granite4 \
  -v ollama-granite4:/root/.ollama \
  quay.io/ollama/ollama

podman run -d --pod ollama-pod \
  --name ollama-qwen-coder \
  -v ollama-qwen-coder:/root/.ollama \
  quay.io/ollama/ollama
```

## Pulling Models

After starting containers, pull the required models:

```bash
# For granite4
podman exec ollama-granite4 ollama pull granite3-dense:8b

# For qwen-coder
podman exec ollama-qwen-coder ollama pull qwen2.5-coder:14b
```

## Testing Deployment

```bash
# Test granite4
curl http://localhost:55077/api/tags

# Test qwen-coder
curl http://localhost:66044/api/tags
```

## Rootless Operation

This deployment runs entirely without root privileges:

- Podman is configured for rootless operation
- User namespaces provide isolation
- Containers run with limited privileges
- No Docker daemon required

## Management Commands

```bash
# Start containers
podman start ollama-granite4 ollama-qwen-coder

# Stop containers
podman stop ollama-granite4 ollama-qwen-coder

# View logs
podman logs -f ollama-granite4
podman logs -f ollama-qwen-coder

# Check status
podman ps

# Remove containers
podman rm -f ollama-granite4 ollama-qwen-coder
```

## Security Considerations

- Containers run in rootless mode
- No privileged containers
- User namespaces enabled by default
- Consider implementing resource limits
- Review Podman security guide for production
