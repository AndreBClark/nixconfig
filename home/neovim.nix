{
  inputs,
  colorschemes,
  ...
}:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
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
      chadtree = {
        enable = true;
        view.openDirection = "left";
      };
      emmet.enable = true;
      telescope.enable = true;
      harpoon.enable = true;
      trim.enable = true;
      vim-css-color.enable = true;
      lint.enable = true;
      commentary.enable = true;
      lsp = {
        enable = true;
        servers = {
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        astro.enable = true; # AstroJS
        phpactor.enable = true; # PHP
        svelte.enable = false; # Svelte
        vuels.enable = false; # Vue
        pyright.enable = true; # Python
        marksman.enable = true; # Markdown
        nil-ls.enable = true; # Nix
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
