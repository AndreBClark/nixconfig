{
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = with inputs; [
    nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals = {
      mapleader = " ";
    };
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
      };
    };
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      laststatus = 3;
      completeopt = "menu,menuone,noselect";
      conceallevel = 2; # Hide * markup for bold and italic, but not markers with substitutions
      confirm = true; # Confirm to save changes before exiting modified buffer
      cursorline = true; # Enable highlighting of the current line
      expandtab = true; # Use spaces instead of tabs
      formatoptions = "jcroqlnt"; # tcqj
      grepformat = "%f:%l:%c:%m";
      ignorecase = true; # Ignore case
      inccommand = "nosplit"; # preview incremental substitute
      list = true; # Show some invisible characters (tabs...
      mouse = "a"; # Enable mouse mode
      pumblend = 10; # Popup blend
      pumheight = 10; # Maximum number of entries in a popup
      scrolloff = 4; # Lines of context
      sessionoptions = [
        "buffers"
        "curdir"
        "tabpages"
        "winsize"
        "help"
        "globals"
        "skiprtp"
        "folds"
      ];
      shiftround = true; # Round indent
      showmode = false; # Dont show mode since we have a statusline
      sidescrolloff = 8; # Columns of context
      signcolumn = "yes"; # Always show the signcolumn, otherwise it would shift the text each time
      smartcase = true; # Don't ignore case with capitals
      smartindent = true; # Insert indents automatically
      splitbelow = true; # Put new windows below current
      splitkeep = "screen";
      splitright = true; # Put new windows right of current
      termguicolors = true; # True color support
      spelllang = lib.mkDefault [ "en_us" ]; # Spell check languages
      # Folding
      foldmethod = "syntax";
      foldlevel = 99; # Folds with a level higher than this number will be closed
      foldcolumn = "1";
      foldenable = true;
      foldlevelstart = -1;
      fillchars = {
        horiz = "━";
        horizup = "┻";
        horizdown = "┳";
        vert = "┃";
        vertleft = "┫";
        vertright = "┣";
        verthoriz = "╋";
        eob = " ";
        diff = "╱";
        fold = " ";
        foldopen = "";
        foldclose = "";
        msgsep = "‾";
      };
      showmatch = true;
      infercase = true;
      clipboard = "unnamedplus";
    };
    plugins = {
      treesitter.enable = true;
      notify.enable = true;
      lualine = {
        enable = true;
        settings = {
          options.theme = lib.mkForce "catppuccin";
          extensions = [
            "fzf"
            "oil"
          ];
        };
      };
      lspkind.enable = true;
      oil.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
      cmp = {
        enable = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "snippy"; }
          { name = "luasnip"; }
          { name = "cmp-dap"; }
          { name = "cmp-treesitter"; }
        ];
        settings.mapping = {
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.scroll_docs(4)";
          "<C-k>" = "cmp.mapping.scroll_docs(-4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-Esc>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          "<Up>" = "cmp.mapping.select_prev_item()";
          "<Down>" = "cmp.mapping.select_next_item()";
          "<Left>" = "cmp.mapping.close()";
          "<Right>" = "cmp.mapping.confirm({ select = true })";
        };
      };
      cmp-treesitter.enable = true;
      lsp-format.enable = true;
      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources.formatting = {
          alejandra.enable = true;
          nixpkgs_fmt.enable = true;
          prettier.enable = true;
          prettierd.enable = true;
          stylua.enable = true;
        };
      };
      bufferline.enable = true;
      #   # transparent.enable = true;
      twilight.enable = true;
      nix-develop.enable = true;
      telescope.enable = true;
      harpoon = {
        enable = true;
        enableTelescope = true;
      };
      trim.enable = true;
      vim-css-color.enable = true;
      lint.enable = true;
      commentary.enable = true;
      web-devicons.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          cssls.enable = true; # CSS
          tailwindcss.enable = true; # TailwindCSS
          html.enable = true; # HTML
          astro.enable = true; # AstroJS
          phpactor.enable = true; # PHP
          svelte.enable = false; # Svelte
          pyright.enable = true; # Python
          marksman.enable = true; # Markdown
          nil_ls = {
            enable = true; # Nix
            settings = {
              nix.flake.autoArchive = true;
              formatting.command = [ "${lib.getExe pkgs.nixfmt}" ];
            };
          };
          dockerls.enable = true; # Docker
          bashls.enable = true; # Bash
          yamlls.enable = true; # YAML
        };
      };
    };
    extraConfigLua = ''
      local cmp_enabled = true
      vim.api.nvim_create_user_command("ToggleAutoComplete", function()
        if cmp_enabled then
          require("cmp").setup.buffer({ enabled = false })
          require("notify")("Disabled Autocomplete", "info")
          cmp_enabled = false
        else
          require("cmp").setup.buffer({ enabled = true })
          require("notify")("Enabled Autocomplete", "info")
          cmp_enabled = true
        end
      end, {})
    '';
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
        key = "<Leader>na";
        action = "<cmd> ToggleAutoComplete <CR>";
        mode = "n";
        options.desc = "Toggle CMP Autocomplete";
      }
    ];
  };
}
