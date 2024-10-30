{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./waybar.nix
    ./binds.nix
    ./rofi.nix
  ];
  home.packages = with pkgs; [
    hypridle
    hyprpaper
  ];

  wayland.windowManager.hyprland = with config.colorScheme.palette; {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$file-explorer" = "nautilus";
      "$browser" = "vivaldi";
      monitor = [
        #        "Unknown-1,disable"
        "DP-1,2560x1440@60.00-vsync,0x0,1"
        "HDMI-A-1,1920x1080@60.00,auto-left,1"
        ",preferred,auto,1"
      ];
      bind = [
        "$mod, S, exec, rofi -show drun -show-icons"
        "ALT, TAB, exec, rofi -show window -show-icons"
      ];
      env = [
        #Qt vars
        #       "QT_QPA_PLATFORM,wayland;xcb"
        #        "QT_QPA_PLATFORMTHEME,qt5ct"
        #        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

        #XDG vars
        "XDG_SESSION_TYPE,wayland"
        #        "XDG_CURRENT_DESKTOP,Hyprland"
        #        "XDG_SESSION_DESKTOP,Hyprland"
        #NVIDIA vars
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NVD_BACKEND,direct"
        #
        #wayland?
        "WLR_DRM_DEVICES=/dev/dri/card1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NIXOS_OZONE_WL,1"
        "GDK_BACKEND,wayland,x11,*"
        "XCURSOR_SIZE,36"
        "XCURSOR_THEME,Catppuccin-Mocha-Sky"
        "HYPRCURSOR_THEME,catppuccin-mocha-sky-cursors"
      ];

      exec-once = [
        "hyprpaper"
        "dunst"
        "xdg-desktop-portal-hyprland"
        "[workspace 1 silent] spotify"
        "hyprctl setcursor catppuccin-mocha-sky-cursors 36"
      ];

      general = {
        gaps_in = 0;
        gaps_out = 2;
        border_size = 4;
        "col.active_border" = "rgba(${base0E}FF)";
        "col.inactive_border" = "rgba(${base08}33)";

        allow_tearing = true;
        resize_on_border = true;
      };
      render.explicit_sync = 1;
      cursor.no_hardware_cursors = true;
      windowrule = [
        "workspace 1,class:(Spotify)"
        "workspace 2, class:(alacritty)"
        "workspace 2, class:(Firefox)"
      ];
      master = {
        no_gaps_when_only = 1;
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          brightness = 0.8;
          contrast = 0.5;
          noise = 6.0e-2;

          vibrancy = 0.2;
          vibrancy_darkness = 0.5;

          passes = 2;
          size = 2;

          popups = false;
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

      misc = {
        # disable auto polling for config file changes
        disable_autoreload = true;

        force_default_wallpaper = 1;

        # disable dragging animation
        animate_mouse_windowdragging = false;

        # enable variable refresh rate (effective depending on hardware)
        vrr = 1;

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
