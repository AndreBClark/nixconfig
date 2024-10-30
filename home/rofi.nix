{
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    tokyonight.enable = false;
    package = pkgs.rofi-wayland;
    extraConfig = {
      /**
              Scan the current users desktop for desktop files.
      */
      scan-desktop = true;
      /**
              Parse user desktop files.
      */
      parse-user = true;
      /**
              Parse system desktop files.
      */
      parse-system = false;
    };
  };
}
