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
    # dracula-icon-theme
    # catppuccin-cursors."${flavor}${Accent}"
    (catppuccin-kde.override {
      accents = [ accent ];
      flavour = [ flavor ];
    })
  ];
  catppuccin = {
    enable = false;
    accent = accent;
    flavor = flavor;
    nvim.enable = true;
    # kvantum.enable = false;
    # kitty.enable = true;
    # starship.enable = false;
    # rofi.enable = true;
    # rofi.flavor = flavor;
    # alacritty.enable = true;
    # vscode.profiles.default.enable = false;
    # fzf.enable = false;
    # cursors = {
    #   enable = true;
    #   accent = accent;
    #   flavor = flavor;
    # };
  };
}
