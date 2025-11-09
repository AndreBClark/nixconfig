{inputs, pkgs, ...}:
let flavor = "mocha"; in {
  imports = with inputs; [
    catppuccin.homeModules.catppuccin
  ];

  home.packages = with pkgs; [
      tokyonight-gtk-theme
      dracula-icon-theme
      papirus-folders
    (catppuccin-kde.override {
      accents = ["sky"];
      flavour = [flavor];
      })
  ];
  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;
#   tokyonight = {
#     enable = true;
#     style = "night";
#   };
services.dunst.enable = true;
  catppuccin = {
    enable = true;
    accent = "sky";
    flavor = flavor;
    kvantum.enable = false;
    kitty.enable = true;
    alacritty.enable = true;
    vscode.profiles.default.enable = false;
    dunst = {
      enable = true;
      flavor = flavor;
    };
    cursors = {
      enable = true;
      accent = "sky";
      flavor = flavor;
    };
  };
}
