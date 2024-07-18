{ 
  inputs
, pkgs
, config
, ...
}:

{
  wayland.windowManager.hyprland = with config.colorScheme.palette; {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$file-explorer" = "dolphin";
      "$browser" = "firefox-devedition";
      monitor = [
        "Unknown-1,disable"
        "DP-2,2560x1440@75,1920x-540,1"
        "HDMI-A-1,1920x1080@60,0x0,1"
        ",preferred,auto,1"
      ];
      bind = [
	"$mod, S, exec, rofi -show drun -show-icons"
      ];
      env = [
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "WLR_DRM_DEVICES=/dev/dri/card1"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
	"NIXOS_OZONE_WL=1"
	"WLR_NO_HARDWARE_CURSORS=1"
	"QT_QPA_PLATFORM,wayland"
	"QT_STYLE_OVERRIDE,kvantum"
	"QT_QPA_PLATFORMTHEME,gt5ct"

      ];

      exec-once = [
      	"hyprpaper"
        "[workspace 2 silent] $terminal"
        "[workspace 2 silent] $browser"
        "[workspace 1 silent] spotify"
      ];


      general = {
        gaps_in = 5;
        gaps_out = 0;
        border_size = 4;
        "col.active_border" = "rgba(${base0E}FF)";
        "col.inactive_border" = "rgba(${base08}33)";

        allow_tearing = true;
        resize_on_border = true;
      };
      windowrule = [
        "workspace 1,class:(Spotify)"
        "workspace 2, class:(alacritty)"
        "workspace 2, class:(Firefox)"
      ];
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 0.5;
          noise = 0.05;

          vibrancy = 0.2;
          vibrancy_darkness = 0.5;

          passes = 2;
          size = 2;

          popups = true;
          popups_ignorealpha = 0.5;
        };

        drop_shadow = false;
        shadow_ignore_window = false;
      };

      animations = {
        enabled = true;
        animation = [
          "border, 1, 2, default"
          "fade, 1, 4, default"
          "windows, 1, 3, default, popin 80%"
          "workspaces, 1, 2, default, slide"
        ];
      };

      group = {
        groupbar = {
          font_size = 10;
          gradients = true;
        };
      };

      input = {
        kb_layout = "us";

        # focus change on cursor move
        follow_mouse = 1;
        accel_profile = "flat";
        touchpad.scroll_factor = 0.1;
      };

      dwindle = {
        # keep floating dimentions while tiling
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        # disable auto polling for config file changes
        disable_autoreload = true;

        force_default_wallpaper = 0;

        # disable dragging animation
        animate_mouse_windowdragging = false;

        # enable variable refresh rate (effective depending on hardware)
        vrr = 1;

        # we do, in fact, want direct scanout
        no_direct_scanout = false;
      };
      # touchpad gestures
      #     gestures = {
      #       workspace_swipe = true;
      #       workspace_swipe_forever = true;
      #     };
      #plugin = {

      #};
    };
  };
}

