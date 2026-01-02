{
  pkgs,
  ...
}:
{
  programs.niri = {
    enable = true;
  };

  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wayland-utils
    libsecret
    cage
    gamescope
    xwayland-satellite
    xdg-desktop-portal-gnome
  ];
}
