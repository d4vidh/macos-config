{ pkgs }:

with pkgs; [
  # version-management
  git

  # virtualization
  podman
  qemu
]
