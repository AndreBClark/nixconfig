{
  inputs,
  pkgs,
  ...
}:
let
  flavor = "mocha";
  Flavor = "Mocha";
  Accent = "Sky";
  accent = "sky";
in
{
  imports = with inputs; [
    catppuccin.homeModules.catppuccin
  ];

  home.packages = with pkgs; [
    dracula-icon-theme
    #       darkly
    papirus-folders
    # catppuccin-cursors."${flavor}${Accent}"
    (catppuccin-kde.override {
      accents = [ accent ];
      flavour = [ flavor ];
    })
  ];
  catppuccin = {
    enable = true;
    accent = accent;
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
      accent = accent;
      flavor = flavor;
    };
  };
}
