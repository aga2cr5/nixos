{ config, lib, pkgs, ... }:

{
programs.neovim = {
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
