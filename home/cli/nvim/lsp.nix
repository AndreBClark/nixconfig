{
  lib,
  pkgs,
  ...
}:
{
  programs.nixvim = {
    plugins = {
      lsp-format.enable = true;
      lspkind.enable = true;
      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources.formatting = {
          alejandra.enable = true;
          nixpkgs_fmt.enable = true;
          biome.enable = true;
          prettier.enable = true;
          prettierd.enable = true;
          stylua.enable = true;
        };
      };
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          biome.enable = true;
          cssls.enable = true; # CSS
          tailwindcss.enable = true; # TailwindCSS
          html.enable = true; # HTML
          astro.enable = true; # AstroJS
          jsonls.enable = true;
          phpactor.enable = true; # PHP
          svelte.enable = false; # Svelte
          pyright.enable = true; # Python
          marksman.enable = true; # Markdown
          nil_ls = {
            enable = true; # Nix
            settings = {
              nix.flake.autoArchive = true;
              formatting.command = [ "${lib.getExe pkgs.nixfmt}" ];
            };
          };
          dockerls.enable = true; # Docker
          bashls.enable = true; # Bash
          yamlls.enable = true; # YAML
        };
      };
      lint.lintersByFt = {
        json = [ "jq" ];
      };
    };
  };
}
