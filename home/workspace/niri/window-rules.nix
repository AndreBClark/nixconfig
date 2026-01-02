{
  radius ? "12",
}:
''
  window-rule {
      open-maximized true
      geometry-corner-radius ${radius}
      clip-to-geometry true
  }
   window-rule {
      match app-id="dms$"
      open-maximized false
  }
  window-rule {
      match app-id="steam$" title="^*$"
      open-floating true
      open-maximized false
  }
  window-rule {
      match title="Bitwarden$"
      open-maximized false
  }
  window-rule {
      match title="^Picture in picture$"
      match title="^Picture-in-Picture$"
      open-floating true
      open-maximized false
      max-width 640
      max-height 360
      default-floating-position x=100 y=200 relative-to="bottom-left"
  }
''
