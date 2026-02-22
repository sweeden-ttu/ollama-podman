# ollama-podman

Ollama deployment using Podman containers for rootless operation.

## Description

This project provides a containerized deployment solution for Ollama using Podman, enabling fully rootless operation without requiring Docker. It offers a secure, lightweight alternative for running Ollama models in isolated containers.

## Features

- **Rootless containers**: Run Ollama without root privileges using Podman's rootless mode
- **Podman native**: Built specifically for Podman, no Docker dependency
- **Multi-platform support**: Works across Linux, macOS, and other Podman-supported platforms

## Fixed Ports

| Service | Port |
|---------|------|
| granite4 | 55077 |
| qwen-coder | 66044 |

## Related Projects

- [toolchain-module](https://github.com/toolchain-module)
- [ollama-hpcc](https://github.com/ollama-hpcc)
- [ollama-rocky](https://github.com/ollama-rocky)
- [ollama-mac](https://github.com/ollama-mac)
- [langflow-ollama-podman](https://github.com/langflow-ollama-podman)

## Installation

```bash
pip install -e src/python/
```

## License

MIT
