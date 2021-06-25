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

## Mac setup using `nix-darwin`

```
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
rm -r result/
```

On a new shell:
```
darwin-rebuild switch -I darwin-config="${HOME}/.config/nixpkgs/darwin.nix"
```
