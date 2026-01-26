{ pkgs, ... }:
{
  programs.nixvim = {
    lsp = {
      inlayHints.enable = true;
      servers = {
        ts_ls.enable = true;
        biome.enable = true;
        cssls.enable = true; # CSS
        tailwindcss.enable = true;
        html.enable = true; # HTML
        astro.enable = true; # AstroJS
        jsonls.enable = true;
        phpactor.enable = true; # PHP
        svelte.enable = true;
        pyright.enable = true; # Python
        marksman = {
          enable = true;
          config = {
            markdown = {
              preferredLinkStyle = "wiki";
            };
          };
        };
        nixd = {
          enable = true;
          config = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };
        dockerls.enable = true; # Docker
        bashls.enable = true; # Bash
        yamlls.enable = true; # YAML
      };
    };
    plugins = {
      lsp.enable = true;
      lspkind.enable = true;
      lsp-format.enable = true;
      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources = {
          formatting = {
            nixpkgs_fmt.enable = true;
            biome.enable = true;
            stylua.enable = true;
          };
          diagnostics = {
            statix.enable = true;
            deadnix.enable = true;
          };
          code_actions = {
            refactoring.enable = true;
            ts_node_action.enable = true;
            statix.enable = true;
          };
        };
      };
      typescript-tools = {
        enable = true;
        settings = {
          separate_diagnostic_server = true;
          complete_function_calls = false;
        };
      };
      lint.lintersByFt = {
        json = [ "jq" ];
      };
    };
    extraPackages = [
      pkgs.jq
      pkgs.nixfmt
    ];
  };
}
