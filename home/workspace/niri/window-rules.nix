''
  window-rule {
    match app-id="org.quickshell" title="Settings"
    open-maximized false
  }
  window-rule {
    match app-id="steam"
    exclude title="^Steam$"
    open-floating true
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
    max-width 640
    max-height 360
    default-floating-position x=50 y=50 relative-to="bottom-right"
  }
  window-rule {
    match app-id=r#"^steam_app_.*"#
    open-fullscreen true
    variable-refresh-rate true
  }
''
