{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lambda";
  home.homeDirectory = "/Users/lambda";

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

  home.packages = [
    pkgs.elixir
    pkgs.ripgrep
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;

    shellAliases = {
      hm = "home-manager";
      g = "git";
    };

    initExtra = ''
    . "${config.home.homeDirectory}/.nix-profile/etc/profile.d/nix.sh"
    '';

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "kubectl" "vi-mode"];
    };
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
