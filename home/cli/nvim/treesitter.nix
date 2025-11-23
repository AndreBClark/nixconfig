{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        nix
        javascript
        typescript
        lua
      ];
      folding = true;
      settings.highlight.enable = true;
    };
    treesitter-context.enable = true;
    treesitter-refactor.enable = true;
  };
}
