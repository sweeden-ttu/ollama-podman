#!/bin/bash

# Daily GitHub Sync Script for ollama-podman
# Synchronizes local repository with GitHub

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

LOG_FILE="${LOG_FILE:-/tmp/github-sync.log}"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "Starting daily GitHub sync for ollama-podman"

if [ ! -d ".git" ]; then
    log "Not a git repository. Skipping sync."
    exit 0
fi

log "Fetching latest changes..."
git fetch --all 2>&1 | tee -a "$LOG_FILE"

log "Checking for updates..."
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main 2>/dev/null || git rev-parse origin/master 2>/dev/null || echo "$LOCAL")

if [ "$LOCAL" != "$REMOTE" ]; then
    log "New changes detected. Pulling..."
    git pull origin main 2>&1 | tee -a "$LOG_FILE" || git pull origin master 2>&1 | tee -a "$LOG_FILE"
else
    log "Repository is up to date."
fi

log "Daily sync completed successfully"
log "---"
