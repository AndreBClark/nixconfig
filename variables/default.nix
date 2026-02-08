{ lib, ... }:
let
  userVars = {
    username = "andrec";
    keyboard = {
      layout = "us";
      options = "caps:escape";
      model = "pc86";
    };
    terminal = "kitty";
    editor = "nvim";
    browser = "vivaldi";
    shell = "fish";
  };
in

{
  options = {
    username = lib.mkOption {
      type = lib.types.str;
      default = userVars.username;
      description = "The username for the system.";
    };

    keyboard = lib.mkOption {
      type = lib.types.attrs;
      default = userVars.keyboard;
      description = "Keyboard layout and options.";
    };

    terminal = lib.mkOption {
      type = lib.types.str;
      default = userVars.terminal;
      description = "The terminal emulator to use.";
    };

    editor = lib.mkOption {
      type = lib.types.str;
      default = userVars.editor;
      description = "The text editor to use.";
    };

    browser = lib.mkOption {
      type = lib.types.str;
      default = userVars.browser;
      description = "The web browser to use.";
    };

    shell = lib.mkOption {
      type = lib.types.str;
      default = userVars.shell;
      description = "The default shell for the user.";
    };
  };

  config = {
    inherit (userVars)
      username
      keyboard
      terminal
      editor
      browser
      shell
      ;
  };
}
