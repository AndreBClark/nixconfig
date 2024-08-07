{ config, pkgs, lib, ... }:

{
  programs.waybar = with config.colorScheme.palette; {
    enable = true;
    systemd.enable = true;
    settings = [{
      height = 48;
      layer = "top";
      position = "bottom";
      spacing = 8;
      modules-left = [
        "custom/os_button"
        "hyprland/workspaces"
        "hyprland/window"
      ];
      modules-center = [
        "wlr/taskbar"
      ];

      modules-right = [
        "tray"
        "custom/spotify"
        "pulseaudio"
        "clock#date"
        "clock#time"
      ];
      "wlr/taskbar" = {
        on-click = "activate";
        on-click-middle = "close";
      };
      "custom/os_button" = {
        format = " ";
	      on-click = "rofi -show drun -show-icons";
	      tooltip = false;
      };
      "custom/spotify" = {
        exec = "nix-shell ~/.config/waybar/scripts/mediaplayer.py --player spotify";
        format = " {}";
        return-type = "json";
        on-click = "playerctl play-pause";
        on-double-click-right = "playerctl next";
        on-scroll-down = "playerctl previous";
      };

      "hyprland/workspaces" = {
        on-click = "activate";
        on-scroll-up = "hyprctl dispatch workspace e-1";
        on-scroll-down = "hyprctl dispatch workspace e+1";
        spacing = 4;
      };
      "hyprland/window" = {
        "max-length" = 120;
      };

      "clock#time" = {
        interval = 1;
        format = "{:%H:%M}";
        #        tooltip = false;
      };

      "clock#date" = {
        interval = 10;
        format = "{:%b %d}";
        tooltip-format = "{:%e %B %Y}";
      };
      tray = {
        spacing = 4;
      };
      pulseaudio = {
        format = "{volume}%  {icon}  {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-icons = {
          car = "";
          default = [ "" "" "" ];
          headphones = "";
        };
        format-muted = " {format_source}";
        format-source = " {volume}% ";
        format-source-muted = "";
        on-click = "pavucontrol";
      };
    }];
    style = ''
      @define-color background-darker #${base01};
      @define-color background #${base00};
      @define-color selection #${base02};
      @define-color foreground #${base07};
      @define-color comment #${base05};
      @define-color cyan #${base0C};
      @define-color green #${base0B};
      @define-color orange #ffb86c;
      @define-color pink #ff79c6;
      @define-color purple #${base0E};
      @define-color red #${base0F};
      @define-color yellow #${base0C};


      * {
        border: none;
        border-radius: 0;
        font-family: Inter;
        font-size: 16px;
        min-height: 0;
      }


      #window {
        margin: 10px 0;
        padding: 10px;
        border-radius: 100px;
        background: @background;
      }

      window#waybar {
      	background: transparent;
        border-bottom: none;
        font-size: 16px;
      }
      button {
        box-shadow: none;
      }
      button:hover {
        box-shadow: none;
      }

      box.module {
        border-radius: 100px;
        padding: 5px;
        background-color: transparent;
        color: @foreground;
      }

      box.modules-right, box.modules-left, box.modules-center {
      background-color: transparent;
        padding: 0 20px;
      }

      box.modules-right {
        border-radius: 100px 0 0 100px;
      }

      box.modules-left {
        padding-left: 0;
        border-radius: 0 100px 100px 0;
      }

      box.modules-center {
        border-radius: 100px;
        font-weight: bold;
      }

      #custom-os_button {
        font-size: 32px;
        padding: 0;
        padding-left: 30px;
        padding-right: 20px;
        border-radius: 0 100px 100px 0;
        background: alpha(@cyan, 0.85);
      }
      #workspaces button {
        padding: 0 20px;
        margin: 10px 5px 10px 5px;
        border-radius: 100px;
        background: transparent;
        color: @foreground;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background-color: @selection;
        color: @background-darker;
      }

      #workspaces button.active {
        background: @purple;
        color: @background;
      }

      #workspaces button.urgent {
        background: @background-darker;
      }

      #taskbar button {
        background: @background;
        border-radius: 100px;
        margin: 10px 5px;
        padding: 10px;
      }

      #taskbar button.active {
        background: @background-darker;
      }

      #clock, #clock#time, #clock#date {
        padding: 0 16px;
        border-radius: 100px;
        background: @purple;
        font-weight: bold;
        color: @background-darker;
        margin: 10px 0;
      }

      #pulseaudio, #tray {
        color: @foreground;
        background: alpha(@background, 0.75);
        padding: 0 20px;
        margin: 10px 0;
        border-radius: 100px;
      }

    '';
  };
}
