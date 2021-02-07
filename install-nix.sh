#! /bin/sh
set -eu

# Install nix
curl -L https://nixos.org/nix/install | sh
. /Users/lambda/.nix-profile/etc/profile.d/nix.sh

# Install home manager

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
