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
        astro
        json
        yaml
        kdl
      ];
      folding.enable = true;
      settings.highlight.enable = true;
    };
    ts-context-commentstring.enable = true;
    comment = {
      enable = true;
      settings = {
        pre_hook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
      };
    };
    treesitter-context.enable = true;
    treesitter-refactor.enable = true;
  };
}
