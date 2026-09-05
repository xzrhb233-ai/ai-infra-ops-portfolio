#!/bin/bash
# W1 D3: install Docker Engine + NVIDIA Container Toolkit inside WSL2 Ubuntu 24.04.
# Run interactively in the WSL shell (needs sudo password prompts) — not from a non-interactive script runner.
set -euo pipefail

echo "== Docker Engine apt repo =="
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "== Run docker without sudo =="
sudo usermod -aG docker "$USER"

echo "== Start docker (systemd is enabled in this WSL distro) =="
sudo systemctl enable --now docker

echo "== NVIDIA Container Toolkit apt repo =="
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | \
  sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
  sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

echo "== Wire the NVIDIA runtime into the Docker daemon =="
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

cat <<'EOF'

Install finished. Log out and back into the WSL shell (or run `newgrp docker`)
so the new docker group membership takes effect, then verify with:

  docker version
  docker run --rm hello-world
  docker run --rm nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi           # WITH GPU access (needs --gpus all too, see below)
  docker run --rm --gpus all nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi
EOF
