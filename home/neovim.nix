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
      lightline.enable = true;
      bufferline.enable = true;
      transparent.enable = true;
      twilight.enable = true;
      nix.enable = true;
      chadtree.enable = true;
      emmet.enable = true;
      fzf-lua.enable = true;
      telescope.enable = true;
      harpoon.enable = true;
      trim.enable = true;
      vim-css-color.enable = true;
      lint.enable = true;
    };
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "storm";
        transparent = true;
        dim_inactive = true;
        lualine_bold = true;
      };
    };

  };
}
