{ ... }:
{
  programs.nixvim.plugins = {
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
    lazygit.enable = true;
    toggleterm.enable = true;
    mini.enable = true;
    oil.enable = true;
    illuminate.enable = true;
    scrollview.enable = true;
    bufferline.enable = true;
    # gitsigns.enable = true;
    gitgutter.enable = true;
    gitblame.enable = true;
    # transparent.enable = true;
    twilight.enable = true;
    nix-develop.enable = true;
    trim.enable = true;
    vim-css-color.enable = true;
    lint.enable = true;
    commentary.enable = true;
    web-devicons.enable = true;
    telescope = {
      enable = true;
      extensions = {
        project.enable = true;
        frecency.enable = true;
        fzf-native.enable = true;
        zoxide.enable = true;
      };
    };
    harpoon = {
      enable = true;
      enableTelescope = true;
    };
  };
}
