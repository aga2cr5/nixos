{
  config,
  lib,
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
        #vim-prisma
        {
          plugin = snacks-nvim;

          # like this ./nvim/plugins/config.lua
          #config = "set the relative location of the config file here";
        }

        vim-nix
        #vim-markdown

        #vim-surround
        #vim-vsnip
        #vim-gitgutter

        #cmp-nvim-lsp
        #cmp-vsnip
        #cmp-path
        #cmp-buffer

        #fzf-lsp-nvim
        #popup-nvim
        #plenary-nvim
        #nvim-dap
      ];
    };
}
