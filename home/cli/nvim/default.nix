{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./lsp.nix
    ./plugins
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    userCommands = {
      W = {
        command = "w";
      };
      Q = {
        command = "q";
      };
    };
    globals = {
      mapleader = " ";
    };
    dependencies.ripgrep.enable = true;
  };
}
