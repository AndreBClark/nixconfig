{ system, ... }:
{
  programs.plasma = {
    shortcuts = {
      ksmserver = {
        "Lock Session" = [
          "Screensaver"
          "Meta+Ctrl+Alt+L"
        ];
        "Log Out" = "Ctrl+Alt+Del";
      };

      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";
      };
    };
    hotkeys.commands = {
      "launch-rofi" = {
        name = "Launch Rofi";
        key = "Meta";
        command = "launcher_t2";
      };
      "launch-filebrowser" = {
        name = "Launch File Browser";
        key = "Meta+f";
        command = "rofi -show file-browser-extended";
      };
    };
  };
}
