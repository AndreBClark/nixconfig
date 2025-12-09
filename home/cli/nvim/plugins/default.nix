{ ... }:
{
  imports = [
    ./treesitter.nix
    ./cmp.nix
  ];
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
    which-key.enable = true;
    lazygit.enable = true;
    toggleterm.enable = true;
    mini.enable = true;
    mini-pairs.enable = true;
    mini-surround.enable = true;
    mini-map.enable = true;
    tiny-inline-diagnostic = {
      enable = true;
      settings = {
        virt_texts = {
          priority = 2048;
        };
      };
    };
    oil.enable = true;
    illuminate.enable = true;
    scrollview.enable = true;
    bufferline.enable = true;
    smart-splits.enable = true;
    # gitsigns.enable = true;
    gitgutter.enable = true;
    # transparent.enable = true;
    twilight.enable = true;
    nix-develop.enable = true;
    trim.enable = true;
    tmux-navigator.enable = true;
    vim-css-color.enable = true;
    lint.enable = true;
    commentary.enable = true;
    web-devicons.enable = true;
    nvim-tree.enable = true;
    nvim-ufo.enable = true;
    bufdelete.enable = true;
    telescope = {
      enable = true;
      extensions = {
        project.enable = true;
        frecency.enable = true;
        fzf-native.enable = true;
        zoxide.enable = true;
        advanced-git-search.enable = true;
      };
      settings.file_ignore_patterns = [
        "^.git/"
        "*.ico"
        "*.lock"
        "*.jpg"
        "*.jpeg"
        "*.png"
      ];
    };
    harpoon = {
      enable = true;
      enableTelescope = true;
    };
  };
}
