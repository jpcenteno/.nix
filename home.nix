{ config, pkgs, ... }:

let
  username = builtins.getEnv "USER";
  homeDirectory = builtins.getEnv "HOME";
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username;
  home.homeDirectory = homeDirectory;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  home.sessionVariables.EDITOR = "vim";

  home.packages = with pkgs; [
    # Tools
    docker
    docker-compose
    ripgrep
    fzf
    ranger
    exercism
    taskwarrior

    # Lang -> Elixir
    elixir
    nodejs

    # Lang -> JavaScript
    nodejs
    nodePackages.npm

    # Lang -> PostgreSQL
    postgresql
  ];

  programs.git = {
    enable = true;
    userName  = "Joaquín P. Centeno";
    userEmail = "jpcenteno@users.noreply.github.com";
    extraConfig = builtins.readFile ./home/git-extra-config;
  };


  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;

    shellAliases = {
      hm = "home-manager";
      g = "git";
      t = "task";
    };

    initExtra = ''
    . "${config.home.homeDirectory}/.nix-profile/etc/profile.d/nix.sh"
    '';

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "kubectl" "vi-mode"];
    };
  };

  programs.direnv = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = false;
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = builtins.readFile ./home/extra-config.vim;

    plugins = with pkgs.vimPlugins; [
      # Programming languages ================================================

      # Elixir
      vim-elixir
      alchemist-vim

      # Julia
      julia-vim

      # Nix language
      vim-nix

      # Editor Features ======================================================
      vim-surround

      # UI ===================================================================
      gruvbox
      nerdtree
      ctrlp-vim
    ];
  };
}
