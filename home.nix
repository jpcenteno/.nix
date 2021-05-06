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

  # Use `fd (1)` instead of `find (1)` as the default input command for `fzf
  # (1)`.
  #
  # Options:
  # --------
  # - `--type f` -- only regular files.
  # - `--hidden` -- Include hidden files
  # - `--follow` -- Follow symlinks.
  # - `--exclude .git` -- Exclude the `.git` directory (not covered by `.gitignore`).
  # - The absence of the option `--no-ignore` instructs `fd` to respect the
  #   `.gitignore`, `.ignore` and `.fdignore` files.
  home.sessionVariables.FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow --exclude .git";

  home.packages = with pkgs; [
    # Tools
    bat
    docker
    docker-compose
    docker-credential-helpers
    ripgrep
    fzf
    fd
    ranger
    exercism
    taskwarrior
    kubectl
    exiftool
    exercism
    jq
    ledger
    niv
    lorri

    # Lang -> Elixir
    elixir

    # Lang -> Erlang
    erlang

    # Lang -> JavaScript
    nodejs
    nodePackages.npm

    # Lang -> PostgreSQL
    postgresql

    # Lang -> Python
    python3
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
      removeexif = "exiftool -all=";
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

      # Clojure
      vim-fireplace

      # Elixir
      vim-elixir
      alchemist-vim

      # Julia
      julia-vim

      # Ledger
      vim-ledger

      # LISP
      vim-sexp
      vim-sexp-mappings-for-regular-people

      # Nix language
      vim-nix

      # Swift
      swift-vim

      # Editor Features ======================================================
      vim-surround
      ultisnips
      vim-snippets # Snippets for `ultisnips`.

      # UI ===================================================================
      gruvbox
      nerdtree
      undotree
      fzf-vim
    ];
  };

  programs.tmux = {
    enable = true;
    keyMode = "vi";

    shortcut = "b";
    baseIndex = 1; # Start indexing from 1, like the keyboard.
    clock24 = true; # Use 24hr clock.

    extraConfig = ''
      bind v split-window -h  # Analog to vi `:vsp`.
      bind h split-window -v  # Analog to vi `:sp`.
      unbind '"'
      unbind %

      # No <esc> delay, as this is annoying for Vim.
      set -s escape-time 0

      # Status Bar
      set -g status-position top
      set -g status-justify left
      set -g status-style 'bg=colour0 fg=colour15' # 0 => black, 15 => white
      set -g status-right ' [ #%m/%d %H:%M:%S ] '
      setw -g window-status-current-format ' { #I => #W #F }'
      setw -g window-status-format ' { #I => #W #F }'
    '';
  };
}
