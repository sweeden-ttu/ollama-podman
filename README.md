# ollama-podman

Ollama deployment using Podman containers for rootless operation.

## Description

This project provides a containerized deployment solution for Ollama using Podman, enabling fully rootless operation without requiring Docker. It offers a secure, lightweight alternative for running Ollama models in isolated containers.

## Features

- **Rootless containers**: Run Ollama without root privileges using Podman's rootless mode
- **Podman native**: Built specifically for Podman, no Docker dependency
- **Multi-platform support**: Works across Linux, macOS, and other Podman-supported platforms

## Ollama port mapping (canonical)

Same mapping across all Ollama projects. Workflows that use **@granite**, **@deepseek**, **@qwen-coder**, or **@codellama** call Ollama on the port for that model and environment.

| Environment        | granite | deepseek | qwen-coder | codellama |
|--------------------|---------|----------|------------|-----------|
| Debug (VPN)        | 55077   | 55088    | 66044      | 66033     |
| Testing +1 (macOS) | 55177   | 55188    | 66144      | 66133     |
| Testing +2 (Rocky) | 55277   | 55288    | 66244      | 66233     |
| Release +3        | 55377   | 55388    | 66344      | 66333     |

See **docs/AGENTS.md** for details.

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
