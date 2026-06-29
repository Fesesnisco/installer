#!/usr/bin/env bash
set -euxo pipefail
cd ~

gh auth status >/dev/null 2>&1 || gh auth login

[ -d "dotfiles" ] || gh repo clone dotfiles

cd ~/dotfiles
cp .dotter/default_local.toml .dotter/local.toml
dotter --force

cd ~
[ -d "nixos" ] || gh repo clone nixos

cd ~/nixos
sudo nixos-rebuild switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake .
