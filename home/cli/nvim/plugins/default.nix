{ lib, ... }:
{
  imports = [
    ./bufferline.nix
    ./cmp.nix
    ./noice.nix
    ./nvim-tree.nix
    ./telescope.nix
    ./toggleterm.nix
    ./treesitter.nix
    ./obsidian-md.nix
  ];
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
    smart-splits.enable = true;
    hmts.enable = true;
    tmux-navigator.enable = true;
    trouble.enable = true;
    trim.enable = true;
    twilight.enable = true;
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

    refactoring = {
      enable = true;
      enableTelescope = lib.mkDefault false;
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
  autoCmd = [
    {
      event = "VimEnter";
      callback.__raw = ''
        function()
          if vim.fn.argc() == 0 then
            vim.defer_fn(function()
              local ok, dashboard = pcall(require, 'dashboard')
              if ok and dashboard and type(dashboard.instance) == 'function' then
                local success, err = pcall(dashboard.instance)
                if not success then
                  vim.notify("Dashboard error: " .. tostring(err), vim.log.levels.ERROR)
                end
              end
            end, 100)  -- Delay by 100ms
          end
        end
      '';
      desc = "Open dashboard on empty start";
    }
  ];
}
