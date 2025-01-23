{
  config,
  pkgs,
  ...
}: let
  user = "olauslintinen";
  homeDir = "/home/${user}";
  scripts = "${homeDir}/programming/scripts";
in {
  imports = [
#    ./nvim
    ./kitty.nix
    ./sh.nix
  ];

nixpkgs.overlays = [
    (import ./mattermost-desktop-overlay.nix)
  ];

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
  home.packages = with pkgs; [
    gnomeExtensions.airpod-battery-monitor

    # apparantly this is super usefull for data engineering stuff and i should
    # take a look at it later on
    # nushell

    # not sure if these need to be declared here or whether it is enough that
    # they are declared in the zsh config. this might be the issue that was
    # fixed with piping source output to /dev/null
    python3
    ripgrep
    zsh-fzf-tab
    zsh-fzf-history-search
    gcc
    fd
    tree
    telegram-desktop
    unzip
    btop
    tmux
    mattermost-desktop
    nmap
    git
    signal-desktop
    xclip
    alejandra
    openvpn
    nodejs
    keepassxc
    postgresql
    element-desktop
    # move vscode to its own module and move all configs related to it to nix file
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  #programs.nixvim = {
  #enable = true;
  #package = nixvim.defaultPackage.${pkgs.stdenv.system};
  #};

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
