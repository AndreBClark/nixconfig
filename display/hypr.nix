{pkgs, inputs, ...}:
{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  xdg.portal.config.hyprland.default = [
    "gtk"
    "hyprland"
  ];
}
