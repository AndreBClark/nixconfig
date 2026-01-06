''
  hotkey-overlay { skip-at-startup; }
  binds {
    Mod+X hotkey-overlay-title="Power Menu" { spawn "dms" "ipc" "powermenu" "toggle"; }
    // programs
    Mod+T hotkey-overlay-title="Open Terminal" { spawn "kitty"; }
    Mod+A { spawn-sh "vicinae toggle"; }
  }
''
