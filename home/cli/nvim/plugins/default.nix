{ lib, ... }:
{
  imports = [
    ./bufferline.nix
    ./cmp.nix
    ./noice.nix
    ./nvim-tree.nix
    ./telescope.nix
    ./treesitter.nix
    ./obsidian-md.nix
  ];
  programs.nixvim = {
    plugins = {
      bufdelete.enable = true;
      dashboard.enable = true;
      illuminate.enable = true;
      lint.enable = true;
      mini-pairs.enable = true;
      mini-surround.enable = true;
      nix-develop.enable = true;
      notify.enable = true;
      nvim-ufo.enable = true;
      render-markdown.enable = lib.mkDefault true;
      scrollview.enable = true;
      smart-splits.enable = true;
      tmux-navigator.enable = true;
      trouble.enable = true;
      trim.enable = true;
      twilight.enable = true;
      vim-css-color.enable = true;
      web-devicons.enable = true;
      gitsigns = {
        enable = true;
        settings = {
          signcolumn = true;
          numhl = false;
          current_line_blame = true;
        };
      };

      lualine = {
        enable = true;
        settings = {
          extensions = [
            "fzf"
            "nvim-tree"
            "toggleterm"
          ];
        };
      };

      tiny-inline-diagnostic = {
        enable = true;
        settings = {
          virt_texts = {
            priority = 2048;
          };
        };
      };

      toggleterm = {
        enable = true;
        settings = {
          shell = "fish";
          size = 20;
          close_on_exit = false;
          shade_terminals = false;
          terminal_mappings = true;
          open_mapping = "[[<c-`>]]";
        };
      };

      which-key = {
        enable = true;
        settings = {
          preset = "modern";
          layout = {
            spacing = 5;
            width = {
              min = 40;
              max = 80;
            };
          };
        };
      };
    };
  };
}
