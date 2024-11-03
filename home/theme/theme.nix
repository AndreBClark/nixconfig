{inputs, pkgs, ...}:{

  home.packages = with pkgs; [
      tokyonight-gtk-theme
      dracula-icon-theme
      adwaita-qt
      papirus-folders
    (catppuccin-kvantum.override {
      accent = "sky";
      variant = "mocha";
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
    pointerCursor = {
      enable = true;
      accent = "sky";
      flavor = "mocha";
    };
  };

}
