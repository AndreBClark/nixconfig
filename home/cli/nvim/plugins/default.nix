{
  imports = [
    ./treesitter.nix
    ./telescope.nix
    ./bufferline.nix
    ./cmp.nix
    ./noice.nix
  ];
  programs.nixvim = {
    plugins = {
      dashboard.enable = true;
      trouble.enable = true;
      notify.enable = true;
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
      mini-pairs.enable = true;
      mini-surround.enable = true;
      tiny-inline-diagnostic = {
        enable = true;
        settings = {
          virt_texts = {
            priority = 2048;
          };
        };
      };
      illuminate.enable = true;
      scrollview.enable = true;
      obsidian.enable = true;
      smart-splits.enable = true;
      gitsigns = {
        enable = true;
        settings = {
          signcolumn = true;
          numhl = false;
          current_line_blame = true;
        };
      };
      # transparent.enable = true;
      twilight.enable = true;
      nix-develop.enable = true;
      trim.enable = true;
      tmux-navigator.enable = true;
      vim-css-color.enable = true;
      lint.enable = true;
      web-devicons.enable = true;
      nvim-tree.enable = true;
      nvim-ufo.enable = true;
      bufdelete.enable = true;
    };
  };
}
