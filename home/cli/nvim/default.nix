{ config, lib, ... }:
let
  stylixEnabled = config.stylix.enable or false;
in
{
  imports = [
    ./options.nix
    ./lsp.nix
    ./plugins
    ./keymaps.nix
  ];
  userCommands = {
    W.command = "w";
    Q.command = "q";
  };
  colorschemes.base16 = {
    enable = !stylixEnabled;
    colorscheme = lib.mkDefault "tokyo-night-dark";
  };
  globals = {
    mapleader = " ";
  };
  dependencies = {
    ripgrep.enable = true;
  };
}
