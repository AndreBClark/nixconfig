let
  inherit (import ../variables/default.nix)
    username
    keyboard
    terminal
    editor
    ;
in
{
  home = {
    inherit username keyboard;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = editor;
      TERMINAL = terminal;
    };
  };
}
