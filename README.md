# copilot-docker

Minimal Docker image for running the GitHub Copilot CLI in a containerized environment.

Features
- Installs the Copilot CLI using the official install script
- Build-time ARG to control the Copilot version

Quick start

Build locally:

```bash
docker build --build-arg COPILOT_VERSION=latest -t copilot:latest .
```

Run interactively (host credentials forwarded via env):

```bash
docker run --rm -it -e GITHUB_TOKEN="$GITHUB_TOKEN" copilot:latest copilot -p "Show me recent commits"
```

CI / publishing

This repository includes a GitHub Actions workflow to build and publish the image to GHCR. The workflow is configurable via `workflow_dispatch` inputs for `image_name`, `image_tag`, and `copilot_version`.

Security
- Avoid running with `--allow-all-tools` unless inside an isolated VM/container.
- Do not mount sensitive directories into this container unless necessary.

Configuration
- `COPILOT_VERSION` build-arg controls which Copilot CLI version to install.

License
MIT
