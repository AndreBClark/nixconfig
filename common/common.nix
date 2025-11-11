{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    pciutils
    envsubst
  ];
  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # This variable fixes electron apps in wayland

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
