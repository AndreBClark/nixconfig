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
        "custom/logo"
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
      "custom/logo" = {
        format = "<big> </big>";
	on-click = "rofi -show drun -show-icons";
	on-hover = "";

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
        format = "{icon}";
        format-icons = {
          "1" = "󰲠";
          "2" = "󰲢";
          "3" = "󰲤";
          "4" = "󰲦";
          #"5" = "󰲨";
          # "6" = "󰲪";
          # "7" = "󰲬";
          # "8" = "󰲮";
          # "9" = "󰲰";
          # "10"=  "󰿬";
          "active" = "";
          "default" = "";
          "empty" = "";
        };
        persistent-workspaces = {
          "*" = 4;
        };
      };
      "hyprland/window" = {
        "max-length" = 128;
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
      #battery = {
      #  format = "{capacity}% {icon}";
      #  format-alt = "{time} {icon}";
      #  format-charging = "{capacity}% ";
      #  format-icons = [ "" "" "" "" "" ];
      #  format-plugged = "{capacity}% ";
      #  states = {
      #    critical = 15;
      #    warning = 30;
      #  };
      #};
      #cpu = {
      #  format = "{usage}% ";
      #  tooltip = false;
      #};
      #memory = { format = "{}% "; };
      #network = {
      #  interval = 1;
      #  format-alt = "{ifname}: {ipaddr}/{cidr}";
      #  format-disconnected = "Disconnected ⚠";
      #  format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
      #  format-linked = "{ifname} (No IP) ";
      #  format-wifi = "{essid} ({signalStrength}%) ";
      #};
      pulseaudio = {
        format = "{volume}%  {icon}  {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-icons = {
          car = "";
          default = [ "" "" "" ];
          handsfree = "";
          headphones = "";
          headset = "";
          phone = "";
          portable = "";
        };
        format-muted = " {format_source}";
        format-source = " {volume}% ";
        format-source-muted = "";
        on-click = "pavucontrol";
      };
    }];
    style = ''
      @define-color background-darker #${base01};
      @define-color background #${base02};
      @define-color selection #44475a;
      @define-color foreground #${base05};
      @define-color comment #6272a4;
      @define-color cyan #${base0C};
      @define-color green #${base0B};
      @define-color orange #ffb86c;
      @define-color pink #ff79c6;
      @define-color purple #${base0E};
      @define-color red #${base0F};
      @define-color yellow #f1fa8c;

      window#waybar {
	background: transparent;
	border-bottom: none;
      }
      * {
	border: none;
	border-radius: 0;
	font-family: Inter;
	font-size: 11pt;
	min-height: 0;
      }
      window#waybar {
	color: @foreground;
      }
      #window {
	margin: 10px 0;
	padding: 10px;
	border-radius: 100px;
	background: @background;
      }

      #workspaces button {
	  padding: 0 20px 0 15px;
	  margin: 10px 5px 10px 5px;
	  border-radius: 100px;
	  background: @background;
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
	    padding: 0 10px;
      }
      #taskbar button.active {
	  background: @background-darker;
      }
      #clock, #clock#time, #clock#date {
	  padding: 0 16px;
	  border-radius: 100px;
	  background: @purple;
	  color: @background-darker;
	  margin: 10px 0;

      }

      #pulseaudio, #tray {
	background: @background;
	padding: 0 10px;
	margin: 10px 0;
	border-radius: 100px;
      }
      box.module {
        border-radius: 100px;
        padding: 0 5px;
      }
      box.modules-right, box.modules-left, box.modules-center {
	    background: @background;
	    padding: 0 20px;
      }
      box.modules-right {
	border-radius: 100px 0 0 100px;
      }
      box.modules-left {
	border-radius: 0 100px 100px 0;
      }
      box.modules-center {
	border-radius: 100px;
      }
    '';
  };
}
