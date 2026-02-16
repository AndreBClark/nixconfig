{
  xdg.configFile."niri/window-rules.kdl".text = ''
    window-rule {
      match app-id="org.quickshell" title="Settings"
      open-maximized false
    }

    window-rule {
      match title="Bitwarden"
      open-maximized false
      open-floating true
    }

    window-rule {
      match title="^Picture in picture$"
      match title="^Picture-in-Picture$"
      open-floating true
      open-maximized false
      default-column-width { proportion 0.25; }
      default-window-height { proportion 0.25; }
      default-floating-position x=50 y=50 relative-to="bottom-right"
    }

    window-rule {
      match app-id=r#"^steam_app_.*"#
      open-fullscreen true
      variable-refresh-rate true
    }
    window-rule {
      match app-id="spotify"
      open-on-workspace "2"
      open-on-output "HDMI-A-1"
      open-maximized true
    }
  '';
}
