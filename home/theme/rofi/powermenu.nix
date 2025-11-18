{
  pkgs,
  username,
  ...
}:
let
  rofi-themes = pkgs.fetchFromGitHub {
    owner = "adi1090x";
    repo = "rofi";
    rev = "093c1a79f58daab358199c4246de50357e5bf462";
    hash = "sha256-iUX0Quae06tGd7gDgXZo1B3KYgPHU+ADPBrowHlv02A=";
  };
  rofi-config = ".config/rofi/";
  powermenu = {
    type = "2";
    style = "5";
    colors = "catppuccin";
  };
in
{
  home.packages = [
    pkgs.icomoon-feather
  ];

  home.file.".config/rofi/shared/colors.rasi".text = ''
    @import "~/.config/rofi/colors/${powermenu.colors}.rasi"
  '';
  home.file.".config/rofi/shared/fonts.rasi".source =
    rofi-themes + "/files/powermenu/type-${powermenu.type}/shared/fonts.rasi";
  home.file.".config/rofi/powermenu.rasi".source =
    rofi-themes + "/files/powermenu/type-${powermenu.type}/style-${powermenu.style}.rasi";
  home.file.".config/rofi/colors/${powermenu.colors}.rasi".source =
    rofi-themes + "/files/colors/${powermenu.colors}.rasi";
  xdg.desktopEntries = {
    rofi = {
      name = "Rofi";
      genericName = "Application Launcher";
      exec = ''rofi -show menu -modi menu:rofi-power-menu -theme /home/${username}/.config/rofi/powermenu.rasi'';
      terminal = false;
      icon = "nix-snowflake-white";
    };
  };
}
