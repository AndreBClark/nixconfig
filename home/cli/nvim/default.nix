{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./lsp.nix
    ./plugins.nix
    ./keymaps.nix
    ./treesitter.nix
    ./cmp.nix
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
  };
}
