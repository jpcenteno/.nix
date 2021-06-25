{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  home-manager.useUserPackages = true;
  home-manager.users.lambda = import ./home.nix;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.vim
      pkgs.emacs
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin.nix
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin.nix";

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  system.defaults.dock.autohide = false;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.showhidden = true;

  system.defaults.trackpad.Clicking = true;
}
