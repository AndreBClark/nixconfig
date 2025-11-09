{inputs, pkgs, ...}:{
  imports = with inputs; [
    catppuccin.homeModules.catppuccin
  ];

  home.packages = with pkgs; [
      tokyonight-gtk-theme
      dracula-icon-theme
      papirus-folders
    (catppuccin-kde.override {
      accents = ["sky"];
      flavour = ["mocha"];
      })
  ];
  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;
  tokyonight = {
    enable= true;
    style = "night";
  };

  catppuccin = {
    enable = true;
    accent = "sky";
    flavor = "mocha";
    kvantum.enable = false;
    kitty.enable = true;
    alacritty.enable = true;
    vscode.profiles.default.enable = false;
    cursors = {
      enable = true;
      accent = "sky";
      flavor = "mocha";
    };
  };
}
