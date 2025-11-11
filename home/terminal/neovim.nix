{
  inputs,
  ...
}:
{
  imports = with inputs; [
    nixvim.homeModules.nixvim
    tokyonight.homeManagerModules.default
    nix-colors.homeManagerModules.default
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      completeopt = "menu,menuone,noselect";
      conceallevel = 2; # Hide * markup for bold and italic, but not markers with substitutions
      confirm = true; # Confirm to save changes before exiting modified buffer
      cursorline = true; # Enable highlighting of the current line
      expandtab = true; # Use spaces instead of tabs
      formatoptions = "jcroqlnt"; # tcqj
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      ignorecase = true; # Ignore case
      inccommand = "nosplit"; # preview incremental substitute
      laststatus = 3; # global statusline
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
    };
    plugins = {
      lazy.enable = true;
      treesitter.enable = true;
      lightline = {
        enable = true;
        settings = {
          colorscheme = "rosepine";
          background = "dark";
        };
      };
      bufferline.enable = true;
      transparent.enable = true;
      twilight.enable = true;
      nix.enable = true;
      nix-develop.enable = true;
      chadtree = {
        enable = true;
        settings.view.open_direction = "left";
      };
      emmet.enable = true;
      telescope.enable = true;
      harpoon.enable = true;
      trim.enable = true;
      vim-css-color.enable = true;
      lint.enable = true;
      commentary.enable = true;
      web-devicons.enable = true;
      lsp = {
        enable = true;
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
            settings.nix.flake.autoArchive = true;
          };
          dockerls.enable = true; # Docker
          bashls.enable = true; # Bash
          yamlls.enable = true; # YAML
        };
      };
    };
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
        transparent = true;
        dim_inactive = true;
        lualine_bold = true;
      };
    };
  };
}
