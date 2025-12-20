{ ... }:
{
  programs.nixvim = {
    keymaps = [
      {
        key = "<space>";
        action = "";
      }
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>Bdelete<CR>";
        options.desc = "Delete buffer";
      }
      {
        mode = [
          "n"
          "v"
        ];
        action = "<cmd>Telescope live_grep<cr>";
        key = "<S-f>";
        options.desc = "Live grep";
      }
      {
        key = "<leader>`";
        action = "<cmd>ToggleTerm<CR>";
        options.desc = "Toggle terminal";
      }
      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Cycle to next buffer";
        };
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "Cycle to previous buffer";
        };
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
        key = ";";
        action = ":";
        options.desc = "Enter command mode";
      }
      {
        mode = "n";
        key = "<leader>ha";
        action.__raw = "function() require'harpoon':list():add() end";
        options.desc = "Harpoon add";
      }
      {
        mode = "n";
        key = "<leader>hh";
        action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
        options.desc = "Harpoon menu";
      }
      {
        mode = "n";
        key = "<leader>1";
        action.__raw = "function() require'harpoon':list():select(1) end";
        options.desc = "Harpoon 1";
      }
      {
        mode = "n";
        key = "<leader>2";
        action.__raw = "function() require'harpoon':list():select(2) end";
        options.desc = "Harpoon 2";
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
        "<leader>ff" = "find_files";
        "<leader>f" = "live_grep";
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
