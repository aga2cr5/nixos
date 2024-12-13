{
  config,
  pkgs,
  ...
}: {
  programs.neovim = let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      let mapleader = " "
      set nowrap
      set termguicolors
      set number

      " Always use system clipboard
      set clipboard+=unnamedplus
    '';

    extraPackages = with pkgs; [tree-sitter fzf];
    plugins = with pkgs.vimPlugins; [
      vim-nix
    ];

  };
}
