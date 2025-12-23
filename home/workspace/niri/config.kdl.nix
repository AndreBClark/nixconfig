{ config, ... }:
let
  radius = 12.0;
in
with config.lib.stylix;
''
    input {
      keyboard {
          xkb {
              layout "us"
              model ""
              rules ""
              variant ""
              options "caps:escape"
          }
          repeat-delay 600
          repeat-rate 25
          track-layout "global"
      }
      touchpad {
          tap
          natural-scroll
      }
  }
  screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
  prefer-no-csd
  overview { backdrop-color ${colors.withHashtag.base00}; }
  layout {
      gaps 16
      struts {
          left -16
          right -16
          top -16
          bottom -16
      }
      focus-ring { off; }
      border {
          width 0
          active-color ${colors.withHashtag.base0D}}
          inactive-color ${colors.withHashtag.base03}}
      }
      default-column-width
      center-focused-column "never"
  }
  cursor {
      xcursor-theme ${cursor.package.pname}
      xcursor-size ${cursor.size}
  }
  hotkey-overlay { skip-at-startup; }
  binds {
      Mod+0 { focus-workspace-previous; }
      Mod+1 { focus-workspace 1; }
      Mod+2 { focus-workspace 2; }
      Mod+3 { focus-workspace 3; }
      Mod+4 { focus-workspace 4; }
      Mod+5 { focus-workspace 5; }
      Mod+6 { focus-workspace 6; }
      Mod+7 { focus-workspace 7; }
      Mod+8 { focus-workspace 8; }
      Mod+9 { focus-workspace 9; }
      Mod+A { spawn-sh "vicinae toggle"; }
      Mod+Alt+N allow-when-locked=true hotkey-overlay-title="Toggle Night Mode" { spawn "dms" "ipc" "night" "toggle"; }
      Mod+BracketLeft { consume-or-expel-window-left; }
      Mod+BracketRight { consume-or-expel-window-right; }
      Mod+Comma hotkey-overlay-title="Toggle Settings" { spawn "dms" "ipc" "settings" "toggle"; }
      Mod+Ctrl+1 { move-column-to-workspace 1; }
      Mod+Ctrl+2 { move-column-to-workspace 2; }
      Mod+Ctrl+3 { move-column-to-workspace 3; }
      Mod+Ctrl+4 { move-column-to-workspace 4; }
      Mod+Ctrl+5 { move-column-to-workspace 5; }
      Mod+Ctrl+6 { move-column-to-workspace 6; }
      Mod+Ctrl+7 { move-column-to-workspace 7; }
      Mod+Ctrl+8 { move-column-to-workspace 8; }
      Mod+Ctrl+9 { move-column-to-workspace 9; }
      Mod+Ctrl+H { move-column-left; }
      Mod+Ctrl+J { move-column-to-workspace-down; }
      Mod+Ctrl+K { move-column-to-workspace-up; }
      Mod+Ctrl+L { move-column-right; }
      Mod+Ctrl+Shift+H { move-column-to-monitor-left; }
      Mod+Ctrl+Shift+J { move-column-to-workspace-down; }
      Mod+Ctrl+Shift+K { move-column-to-workspace-up; }
      Mod+Ctrl+Shift+L { move-column-to-monitor-right; }
      Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
      Mod+Ctrl+WheelScrollUp cooldown-ms=150 { move-column-to-workspace-up; }
      Mod+E { switch-focus-between-floating-and-tiling; }
      Mod+F { maximize-column; }
      Mod+H { focus-column-left; }
      Mod+I { focus-workspace-previous; }
      Mod+J { focus-workspace-down; }
      Mod+K { focus-workspace-up; }
      Mod+L { focus-column-right; }
      Mod+M hotkey-overlay-title="Toggle Process List" { spawn "dms" "ipc" "processlist" "toggle"; }
      Mod+N hotkey-overlay-title="Toggle Notification Center" { spawn "dms" "ipc" "notifications" "toggle"; }
      Mod+P hotkey-overlay-title="Toggle Notepad" { spawn "dms" "ipc" "notepad" "toggle"; }
      Mod+Print { screenshot-screen show-pointer=false; }
      Mod+Q repeat=false { close-window; }
      Mod+R { switch-preset-column-width; }
      Mod+Return { toggle-overview; }
      Mod+S { screenshot; }
      Mod+Shift+F { fullscreen-window; }
      Mod+Shift+H { focus-monitor-left; }
      Mod+Shift+J { focus-workspace-down; }
      Mod+Shift+K { focus-workspace-up; }
      Mod+Shift+L { focus-monitor-right; }
      Mod+Shift+Slash { show-hotkey-overlay; }
      Mod+Space hotkey-overlay-title="Toggle Application Launcher" { spawn "dms" "ipc" "spotlight" "toggle"; }
      Mod+T { spawn-sh "kitty"; }
      Mod+U { focus-monitor-previous; }
      Mod+V hotkey-overlay-title="Toggle Clipboard Manager" { spawn "dms" "ipc" "clipboard" "toggle"; }
      Mod+W { toggle-window-floating; }
      Mod+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
      Mod+WheelScrollUp cooldown-ms=150 { focus-workspace-up; }
      Mod+X hotkey-overlay-title="Toggle Power Menu" { spawn "dms" "ipc" "powermenu" "toggle"; }
      Super+Alt+L hotkey-overlay-title="Toggle Lock Screen" { spawn "dms" "ipc" "lock" "lock"; }
      XF86AudioLowerVolume allow-when-locked=true { spawn "dms" "ipc" "audio" "decrement" "3"; }
      XF86AudioMicMute allow-when-locked=true { spawn "dms" "ipc" "audio" "micmute"; }
      XF86AudioMute allow-when-locked=true { spawn "dms" "ipc" "audio" "mute"; }
      XF86AudioRaiseVolume allow-when-locked=true { spawn "dms" "ipc" "audio" "increment" "3"; }
      XF86MonBrightnessDown allow-when-locked=true { spawn "dms" "ipc" "brightness" "decrement" "5" ""; }
      XF86MonBrightnessUp allow-when-locked=true { spawn "dms" "ipc" "brightness" "increment" "5" ""; }
  }
  window-rule {
      open-maximized-to-edges true
      geometry-corner-radius ${radius} ${radius} ${radius} ${radius}
      clip-to-geometry true
  }
  window-rule {
      match app-id="firefox$" title="^Picture-in-Picture$"
      match app-id="vivaldi$" title="^Picture-in-Picture$"
      match app-id="steam$" title="^*$"
      open-floating true
  }
''
