{
  imports = [
    ./treesitter.nix
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
      bufferline = {
        enable = true;
        settings = {
          options = {
            mode = "buffers";
            themable = true;
            numbers = "none";
            buffer_close_icon = "󰅖";
            modified_icon = "●";
            close_icon = "";
            indicator = {
              style = "icon";
              icon = "▎";
            };
            separator_style = "slope";
            max_name_length = 20;
            max_prefix_length = 15;
            truncate_names = true;
            tab_size = 20;
            color_icons = true;
            show_buffer_icons = true;
            show_buffer_close_icons = true;
            show_close_icon = true;
            show_tab_indicators = true;
            diagnostics = "nvim_lsp";
            diagnostics_indicator =
              # Lua
              ''
                function(count, level, diagnostics_dict, context)
                  local s = ""
                  for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " "
                      or (e == "warning" and " " or "" )
                    if(sym ~= "") then
                      s = s .. " " .. n .. sym
                    end
                  end
                  return s
                end
              '';
            sort_by = "insert_after_current";
            always_show_bufferline = true;
            offsets = [
              {
                filetype = "neo-tree";
                text = "File Explorer";
                text_align = "center";
                highlight = "Directory";
              }
            ];
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
              "flake.lock"
              "pnpm-lock.yaml"
              "package-lock.json"
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
          pickers = {

            git_files = {
              show_untracked = true;
              recurse_submodules = false;
            };
          };
        };

        extensions = {
          project = {
            enable = true;
            settings = {
              base_dirs = [
                "~/repos"
                "~/nixconfig"
              ];
              hidden_files = false;
            };
          };
          frecency.enable = true;
          fzf-native.enable = true;
          zoxide.enable = true;
          advanced-git-search.enable = true;
          live-grep-args = {
            enable = true;
            settings = {
              auto_quoting = true;
            };
          };
        };
      };
    };
    extraConfigLua = ''
      function getVisualSelection()
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg('v')
        vim.fn.setreg("v", {})

        text = string.gsub(text, "\n", "")
        if #text > 0 then
          return text
        else
          return ""
        end
      end
    '';
  };
}
