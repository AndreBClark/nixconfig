{ ... }:
{
  imports = [
    ./treesitter.nix
    ./cmp.nix
    ./noice.nix
  ];
  programs.nixvim = {
    plugins = {
      dashboard.enable = true;
      notify.enable = true;
      lualine = {
        enable = true;
        settings = {
          extensions = [
            "fzf"
            "oil"
          ];
        };
      };
      which-key = {
        enable = true;
        settings = {
          preset = "helix";
          notify = true;
          layout = {
            spacing = 5;
            width = {
              min = 40; # Minimum width for centering
              max = 80; # Maximum width
            };
          };
          win = {
            no_overlap = true; # Position to avoid cursor
          };
        };
      };
      toggleterm = {
        enable = true;
        settings = {
          # VSCode-like horizontal terminal at bottom
          direction = "horizontal";
          size = 20; # Similar to VSCode's default terminal height

          # Terminal behavior matching VSCode
          start_in_insert = true;
          auto_scroll = true;
          close_on_exit = false; # Keep terminal open like VSCode
          persist_size = true;
          persist_mode = true;

          # Clean appearance like VSCode
          shade_terminals = false; # No shading for clean look
          hide_numbers = true;

          # Minimal border like VSCode
          float_opts = {
            border = "single";
            winblend = 0;
          };
          # Terminal mappings for VSCode-like behavior
          insert_mappings = true;
          terminal_mappings = false;
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
      oil.enable = true;
      illuminate.enable = true;
      scrollview.enable = true;
      bufferline = {
        enable = true;
        settings = {
          options = {
            offsets = [
              {
                filetype = "neo-tree";
                text = "File Explorer";
                text_align = "center";
                highlight = "Directory";
              }
            ];
            diagnostics = "nvim_lsp";
            show_buffer_close_icons = true;
            show_close_icon = false;
          };
        };
      };
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
      telescope = {
        enable = true;
        settings = {
          defaults = {
            file_ignore_patterns = [
              "^.git/"
              "*.ico"
              "*.lock"
              "*.jpg"
              "*.jpeg"
              "*.png"
              "node_modules"
              ".venv"
            ];
            layout_config = {
              prompt_position = "top";
            };
            sorting_strategy = "ascending";
          };
        };
        extensions = {
          project.enable = true;
          frecency.enable = true;
          fzf-native.enable = true;
          zoxide.enable = true;
          advanced-git-search.enable = true;
        };
      };
      harpoon = {
        enable = true;
        enableTelescope = true;
      };
    };
  };
}
