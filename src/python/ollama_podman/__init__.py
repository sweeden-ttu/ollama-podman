"""ollama-podman: Ollama deployment using Podman containers."""

__version__ = "0.1.0"
__author__ = "ollama-podman Contributors"

from . import cli
from . import container
from . import config

__all__ = ["cli", "container", "config"]
