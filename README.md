My Nix home-manager config
==========================

This is an experiment where I try to manage my packages and dotfiles using Nix
and home-manager.

## Setup

```sh
git clone git@github.com:jpcenteno/.nix.git "${HOME}/.config/nixpkgs"
cd "${HOME}/.config/nixpkgs"
./install-nix.sh
```

## Usage

- To update a shell environment, run `home-manager switch`.
