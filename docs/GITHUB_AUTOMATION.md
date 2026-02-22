# GitHub Automation

This document describes the GitHub automation workflows for the ollama-podman project.

## Automation Scripts

### daily-github-sync.sh

Located in `scripts/daily-github-sync.sh`, this script performs daily synchronization tasks.

## Features

- Git repository synchronization
- Pull latest changes from remote
- Push local commits to remote
- Backup repository state

## Usage

```bash
./scripts/daily-github-sync.sh
```

## Configuration

Set the following environment variables:

```bash
export GITHUB_REPO="username/ollama-podman"
export GITHUB_TOKEN="your-github-token"
```

## Cron Setup

Add to crontab for daily execution:

```bash
0 6 * * * /path/to/ollama-podman/scripts/daily-github-sync.sh >> /var/log/github-sync.log 2>&1
```

## Requirements

- Git
- GitHub CLI (gh) or git with proper credentials
- Network access to GitHub

## Security Notes

- Store GitHub tokens securely
- Use personal access tokens with minimal permissions
- Never commit tokens to repository
