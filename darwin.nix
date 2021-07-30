{ config, pkgs, ... }:

let
  current_username = builtins.getEnv "USER";

in
{
  imports = [ <home-manager/nix-darwin> ];

  home-manager.useUserPackages = true;
  home-manager.users.${current_username} = import ./home.nix;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.emacs
      pkgs.lorri
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin.nix
  environment.darwinConfig = "$HOME/Code/nix/darwin.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  system.defaults.dock.autohide = true;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.showhidden = true; # Make icons of hidden apps translucent.
  system.defaults.dock.tilesize = 48;

  system.defaults.trackpad.Clicking = true;

  # Start the Lorri daemon as a `launchctl` "user agent", which runs on behalf
  # of the current logged in user.
  #
  # See: https://github.com/target/lorri/issues/96#issuecomment-579931485
  # See: https://launchd.info/
  launchd.user.agents.lorri = {
    serviceConfig = {
      WorkingDirectory = (builtins.getEnv "HOME");
      EnvironmentVariables = { };
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/var/tmp/lorri.log";
      StandardErrorPath = "/var/tmp/lorri.log";
    };
    script = ''
        source ${config.system.build.setEnvironment}
        exec ${pkgs.lorri}/bin/lorri daemon
    '';
  };

}
