{
  pkgs,
  ...
}:
{
  programs.niri = {
    enable = true;
  };

  environment = {
    variables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      wl-clipboard
      wayland-utils
      libsecret
      cage
      gamescope
      xwayland-satellite
      xdg-desktop-portal-gnome
    ];
    etc."xdg/menus/applications.menu".source =
      "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  };
}
