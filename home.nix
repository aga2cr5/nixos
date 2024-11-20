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
in {

  imports = [
    ./nvim.nix
    ./kitty.nix
    ./sh.nix
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
    # gnomeExtensions.airpods-battery-status
    gnomeExtensions.airpod-battery-monitor
    
    # apparantly this is super usefull for data engineering stuff and i should
    # take a look at it later on
    # nushell

    # not sure if these need to be declared here or whether it is enough that
    # they are declared in the zsh config. this might be the issue that was
    # fixed with piping source output to /dev/null
    zsh-fzf-tab
    zsh-fzf-history-search
    
    fd
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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
