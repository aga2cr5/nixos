{
  config,
  pkgs,
  nixpkgs-unstable,
  nixvim,
  ...
}: let
  user = "olauslintinen";
  homeDir = "/home/${user}";
  scripts = "${homeDir}/programming/scripts";
  myAliases = {
    rebuild = "(/bin/sh ${scripts}/rebuild.sh)";
    airpods = "/bin/sh ${scripts}/airpods/airpods_toggle.sh";
    movies = "vim ${homeDir}/Documents/movies";
    television = "/bin/sh ${scripts}/television_toggle.sh";
  };
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = user;
  home.homeDirectory = homeDir;

  programs.git = {
    enable = true;
    userName = "aga2cr5";
    userEmail = "kodak2cr5@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # pkgs.gnomeExtensions.airpods-battery-status
    pkgs.gnomeExtensions.airpod-battery-monitor
    pkgs.nushell
    pkgs.zsh-fzf-tab
    pkgs.zsh-fzf-history-search
    pkgs.kitty
    pkgs.neovim
    pkgs.fd
    #nixvim.defaultPackage.${pkgs.stdenv.system}
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # or apparently this could be imported from modules earlier and have nixvim config in a separate module
  # check this: https://discourse.nixos.org/t/installing-and-configuring-nixvim-entirely-from-home-manager/41116/17
  #programs.nixvim = {
    #enable = true;
    #package = nixvim.defaultPackage.${pkgs.stdenv.system};
  #};

  programs.kitty = {
enable = true;
#enableZshIntegration = true;

# https://sw.kovidgoyal.net/kitty/conf/#window-layout
  settings = {
    shell = "zsh";
    window_padding_width = 10;
    scrollback_lines = 10000;
    show_hyperlink_targets = "yes";
    enable_audio_bell = false;
    url_style = "none";
    underline_hyperlinks = "never";
    copy_on_select = "clipboard";
    background_opacity = "0.8";
    background_blur = 1;
    remember_window_size = "yes";

    initial_window_width = 120;
    initial_window_height = 80;
  };

  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    #for some reason this option was not recognized. it should be true by default though
    #enableLsColors = true;

    shellAliases = myAliases;
    history = {
      size = 10000;
      path = "${homeDir}/.zsh_history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "robbyrussell";
    };

    initExtra = ''
      source ${pkgs.zsh-fzf-history-search}/share/fzf-history-search/fzf-history-search.plugin.zsh
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
