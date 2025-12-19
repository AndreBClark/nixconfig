{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.niri.nixosModules.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wayland-utils
    libsecret
    cage
    gamescope
    xwayland-satellite-unstable
    xdg-desktop-portal-gnome
  ];
}
