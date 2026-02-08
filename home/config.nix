{ config, ... }:
{
  home = {
    inherit (config) username keyboard;
    homeDirectory = "/home/${config.username}";

    sessionVariables = {
      EDITOR = config.editor;
      TERMINAL = config.terminal;
    };
  };
}
