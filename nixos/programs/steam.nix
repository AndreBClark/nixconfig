{
  pkgs,
  lib,
  ...
}:
{
  environment = {
    systemPackages = builtins.attrValues {
      inherit (pkgs)
        samrewritten
        sgdboop
        lsfg-vk-ui
        steamtinkerlaunch
        ;
    };
    sessionVariables = {
      XCURSOR_THEME = "volantes-cursors";
      XCURSOR_SIZE = "24";
      # PROTON_NO_FSYNC = "1";
      # PROTON_NO_ESYNC = "1";
    };
  };

  xdg.icons.fallbackCursorThemes = lib.mkForce [
    "volantes-cursors"
    "volantes_cursors"
    "breeze_cursors"
  ];
  programs = {
    steam = {
      enable = true;
      package = pkgs.millennium-steam;
      remotePlay.openFirewall = true;
      protontricks.enable = true;
      localNetworkGameTransfers.openFirewall = true;
      extraPackages = builtins.attrValues {
        inherit (pkgs)
          gamescope
          mangohud
          winetricks
          faudio
          dxvk
          lsfg-vk
          ;
      };
      extraCompatPackages = builtins.attrValues {
        inherit (pkgs)
          proton-ge-bin
          steamtinkerlaunch
          steam-play-none
          ;
      };
    };
    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--force-windows-fullscreen"

        # Resolution and display
        "-w 2560"
        "-h 1440" # Set your native resolution
        "--fullscreen" # Force fullscreen
        "--borderless" # Borderless windowed mode

        # Performance optimizations
        "--rt" # Real-time scheduling

        # Wayland/Niri compatibility
        "--disable-xres" # Disable X resource extension
      ];

    };
    xwayland.enable = true;
    gamemode.enable = true;
  };
}
