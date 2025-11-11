{inputs, pkgs, ...}:
let flavor = "mocha"; in {
  imports = with inputs; [
    catppuccin.homeModules.catppuccin
  ];

  home.packages = with pkgs; [
      dracula-icon-theme
#       darkly
      papirus-folders

    (catppuccin-kde.override {
      accents = ["sky"];
      flavour = ["mocha"];
    })
  ];
  catppuccin = {
    enable = true;
    accent = "sky";
    flavor = flavor;
    kvantum.enable = false;
    kitty.enable = true;
    starship.enable = true;
    rofi.enable = true;
    rofi.flavor = flavor;
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
