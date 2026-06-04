{ lib, config, ... }:
{
  gtk = {
    enable = true;
    gtk4.theme = lib.mkDefault config.gtk.theme;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };
  xdg.configFile = {
    "gtk-3.0/gtk.css".force = true;
    "gtk-4.0/gtk.css".force = true;
  };
}
