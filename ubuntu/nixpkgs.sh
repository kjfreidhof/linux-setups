#!/bin/bash
set -e
nix=("nixpkgs.firefox" "nixpkgs.neovim")

nix-env -iA "${nix[@]}"

