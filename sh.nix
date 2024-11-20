{ config, lib, pkgs, ... }:

let
  user = "olauslintinen";
  homeDir = "/home/${user}";
  scripts = "${homeDir}/programming/scripts";
  myAliases = {
    rebuild = "(/bin/sh ${scripts}/rebuild.sh)";
    airpods = "/bin/sh ${scripts}/airpods/airpods_toggle.sh";
    movies = "nvim ${homeDir}/Documents/movies";
    television = "/bin/sh ${scripts}/television_toggle.sh";
  };
in {
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
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
      # just an attempt to direct error messages by directing them to /dev/null
        source ${pkgs.zsh-fzf-history-search}/share/fzf-history-search/fzf-history-search.plugin.zsh 2>/dev/null
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';
  };
}

