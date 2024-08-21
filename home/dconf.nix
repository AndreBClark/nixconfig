# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "com/github/tchx84/Flatseal" = {
      selected-app-id = "org.kde.xwaylandvideobridge";
      window-height = 768;
      window-maximized = false;
      window-width = 1024;
    };

    "com/usebottles/bottles" = {
      window-height = 640;
      window-width = 880;
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-reader-enabled = false;
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-size = 16;
      cursor-theme = "Catppuccin-Mocha-Sky";
      enable-animations = true;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "Inter V, Demi Bold 10";
      font-rgba-order = "rgb";
      gtk-theme = "Mocha-Sky";
      icon-theme = "Papirus-Dark";
      scaling-factor = mkUint32 1;
      text-scaling-factor = 1.0;
      toolbar-icons-size = "small";
      toolbar-style = "text";
    };

    "org/gnome/desktop/sound" = {
      event-sounds = false;
      input-feedback-sounds = false;
      theme-name = "oxygen";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":";
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "small";
    };

    "org/gnome/nautilus/list-view" = {
      default-column-order = [ "name" "size" "type" "owner" "group" "permissions" "date_modified" "date_accessed" "date_created" "recency" "detailed_type" ];
      default-visible-columns = [ "name" "size" "date_modified" ];
      default-zoom-level = "large";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      maximized = true;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      sidebar-width = 140;
      sort-column = "modified";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
    };

    "org/gtk/settings/color-chooser" = {
      selected-color = mkTuple [ true 0.0 0.0 0.0 1.0 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 156;
      sort-column = "modified";
      sort-directories-first = true;
      sort-order = "descending";
      type-format = "category";
      window-position = mkTuple [ 0 0 ];
      window-size = mkTuple [ 1267 1319 ];
    };

    "org/x/warpinator/preferences" = {
      ask-for-send-permission = true;
      autostart = false;
      no-overwrite = true;
    };

  };
}
