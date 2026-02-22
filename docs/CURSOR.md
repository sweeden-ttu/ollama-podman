# Cursor IDE Configuration

This document provides guidance for using Cursor IDE with the ollama-podman project.

## Project-Specific Settings

### Environment Variables

Set the following environment variables in Cursor:

```bash
# Podman configuration
export PODMAN_PREFIX="ollama-"
export PODMAN_GRANITE_PORT=55077
export PODMAN_QWEN_PORT=66044
```

### Python Path

Add the src/python directory to your Python path:

```bash
export PYTHONPATH="${PYTHONPATH}:/path/to/ollama-podman/src/python"
```

## Cursor Features

### AI Assistant Integration

Configure Cursor's AI to use Ollama endpoints:

- Granite4: `http://localhost:55077`
- Qwen-Coder: `http://localhost:66044`

### Code Completion

The project supports code completion through the Ollama models running in Podman containers.

### Terminal Integration

Use the integrated terminal for running Podman commands:

```bash
# Check container status
podman ps

# View logs
podman logs -f ollama-granite4
```

## Recommended Extensions

- Python language server
- YAML support
- Shell integration
- GitLens (if using git)

## Project Navigation

```
ollama-podman/
├── docs/           # Documentation
├── scripts/        # Shell scripts
├── src/
│   └── python/
│       └── ollama_podman/  # Python package
└── README.md
```

## Debugging

Set breakpoints in Python code and use Cursor's debugger to troubleshoot the Ollama integration.
