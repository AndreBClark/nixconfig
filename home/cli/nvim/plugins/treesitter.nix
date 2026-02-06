{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        nixGrammars = false;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          nix
          javascript
          typescript
          lua
          astro
          json
          yaml
          kdl
          html
          css
        ];
        folding.enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
          # ensure_installed = [
          #   "astro"
          #   "typescript"
          #   "javascript"
          #   "tsx"
          #   "jsx"
          # ];
        };
      };

      # These depend on treesitter and should work with the above config
      ts-context-commentstring.enable = true;
      comment = {
        enable = true;
          settings = {
            pre_hook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
          };
      };
      # treesitter-context.enable = true;
    };
    dependencies = {
      gcc.enable = true;
      nodejs.enable = true;
      tree-sitter.enable = true;
    };
  };
}
