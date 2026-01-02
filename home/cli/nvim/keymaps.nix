{ lib, ... }:
{
  programs.nixvim = {
    globals.mapleader = lib.mkDefault " ";
    keymaps = [
      {
        key = ";";
        action = ":";
        options.desc = "Enter command mode";
      }
      {
        key = "<space>";
        action = "";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>Bdelete<CR>";
        options.desc = "Delete buffer";
      }
      {
        key = "<leader>q";
        mode = "n";
        action = "<cmd>close<cr>";
        options.desc = "close split";
      }
      {
        key = "<leader>-";
        mode = "n";
        action = "<cmd>split<CR>";
        options.desc = "horizontal split buffer";
      }
      {
        key = "<leader>\\";
        mode = "n";
        action = "<cmd>vsplit<CR>";
        options.desc = "vertical split buffer";
      }

      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options.desc = "Cycle to next buffer";
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options.desc = "Cycle to previous buffer";
      }
      {
        key = "<C-`>";
        action = "<cmd>ToggleTerm<CR>";
        options.desc = "Toggle terminal";
      }
      {
        key = "<leader>`";
        action = "<cmd>ToggleTerm<CR>";
        options.desc = "Toggle terminal";
      }
      {
        mode = "n";
        key = "zR";
        action = "<cmd>lua require('ufo').openAllFolds()<cr>";
        options = {
          desc = "Open all folds";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "zM";
        action = "<cmd>lua require('ufo').closeAllFolds()<cr>";
        options = {
          desc = "Close all folds";
          silent = true;
        };
      }
      {
        key = "<S-f>";
        mode = [
          "n"
          "v"
        ];
        action.__raw = ''
          function()
            local text = getVisualSelection()
            require('telescope').extensions.live_grep_args.live_grep_args({
              default_text = text,
            })
          end
        '';
        options.desc = "find in files";
      }
    ];
    plugins = {
      lsp.keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "K" = "hover";
          "gi" = "implementation";
        };
      };
      telescope.keymaps = {
        "<C-p>" = "find_files";
        "<leader><Tab>" = "buffers";
        "<leader>fd" = "find_files";
        "<leader>ff" = "live_grep_args";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>fp" = "project";
        "<leader>fr" = "frecency";
        "<leader>fz" = "zoxide list";
        "<leader>fg" = "advanced_git_search";
      };
    };

  };
}
