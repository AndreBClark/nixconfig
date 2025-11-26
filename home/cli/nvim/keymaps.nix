{ ... }:
{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>ha";
        action.__raw = "function() require'harpoon':list():add() end";
      }
      {
        mode = "n";
        key = "<C-e>";
        action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
      }
      {
        mode = "n";
        key = "<C-j>";
        action.__raw = "function() require'harpoon':list():select(1) end";
      }
      {
        mode = "n";
        key = "<C-k>";
        action.__raw = "function() require'harpoon':list():select(2) end";
      }
      {
        mode = "n";
        key = "<C-l>";
        action.__raw = "function() require'harpoon':list():select(3) end";
      }
      {
        mode = "n";
        key = "<C-m>";
        action.__raw = "function() require'harpoon':list():select(4) end";
      }
      {
        key = "<C-p>";
        action = "<cmd>Telescope fd<CR>";
      }
      {
        key = "<C-`>";
        action = "<cmd>ToggleTerm<CR>";
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
        key = "<Leader>na";
        action = "<cmd> ToggleAutoComplete <CR>";
        mode = "n";
        options.desc = "Toggle CMP Autocomplete";
      }
      {
        mode = "n";
        key = "<C-w>";
        action = "Bdelete";
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
    ];
  };
}
