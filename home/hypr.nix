{ inputs
, pkgs
, ...
}:

{
  wayland.windowManager.hyprland = {
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
      ];

      exec-once = [
      	"hyprpaper"
        "[workspace 2 silent] $terminal"
        "[workspace 2 silent] $browser"
        "[workspace 1 silent] spotify"
      ];


      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 3;
        "col.active_border" = "rgba(bd93f988)";
        "col.inactive_border" = "rgba(282a3688)";

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
          contrast = 1.0;
          noise = 0.01;

          vibrancy = 0.2;
          vibrancy_darkness = 0.5;

          passes = 4;
          size = 7;

          popups = true;
          popups_ignorealpha = 0.2;
        };

        drop_shadow = true;
        shadow_ignore_window = true;
        shadow_offset = "0 2";
        shadow_range = 20;
        shadow_render_power = 3;
        "col.shadow" = "rgba(00000055)";
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
          gradients = false;
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
      plugin = {
        hyprbars = {
          bar_height = 20;
          bar_precedence_over_border = true;
          # order is right-to-left
          hyprbars-button = [
            # close
            "rgb(ff0000), 15, , hyprctl dispatch killactive"
            # maximize
            "rgb(ffff00), 15, , hyprctl dispatch fullscreen 1"
          ];
        };
        hyprexpo = {
          columns = 3;
          gap_size = 4;
          bg_col = "rgb(000000)";
          enable_gesture = true;
          gesture_distance = 300;
          gesture_positive = false;
	};
      };
    };
};
# services.hypridle = {
#  enable = true;

#  settings = {
#    general = {
#      after_sleep_cmd = "hyprctl dispatch dpms on";
#      ignore_dbus_inhibit = false;
#      lock_cmd = "hyprlock";
#    };
#    listener = [
#      {
#        timeout = 900;
#        on-timeout = "hyprlock";
#      }
#      {
#        timeout = 1200;
#        on-timeout = "hyprctl dispatch dpms off";
#        on-resume = "hyprctl dispatch dpms on";
#      }
#    ];
#  };
}

