{inputs, pkgs, ...}: {
services = {
  hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = ["~/Pictures/Wallpapers/FF.violet/Titan_Caligula.png"];
      wallpaper = [",~/Pictures/Wallpapers/FF.violet/Titan_Caligula.png"];
    };
  };

  hypridle = {
    enable = true;
    settings = {
      general = {
	after_sleep_cmd = "hyprctl dispatch dpms on";
	ignore_dbus_inhibit = false;
	lock_cmd = "hyprlock";
      };
      listener = [
	{
	  timeout = 1200;
	  on-timeout = "hyprctl dispatch dpms off";
	  on-resume = "hyprctl dispatch dpms on";
	}
      ];
    };
  };
};
}
