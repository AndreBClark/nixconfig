{ pkgs, ... }:
{
  lsp = {
    inlayHints.enable = true;
    servers = {
      ts_ls.enable = true;
      biome = {
        enable = true;
        settings = {
          linter = {
            enabled = true;
            rules.recommended = true;
          };
          assist = {
            enabled = true;
            actions.source.organizeImports = "on";
          };
        };
      };
      cssls.enable = true;
      tailwindcss.enable = true;
      html.enable = true;
      astro.enable = true;
      jsonls.enable = true;
      phpactor.enable = true;
      svelte.enable = true;
      pyright.enable = true;
      marksman = {
        enable = true;
        settings = {
          markdown = {
            preferredLinkStyle = "wiki";
          };
        };
      };
      nixd = {
        enable = true;
        settings = {
          formatting = {
            command = [ "nixpkgs-fmt" ];
          };
        };
      };
      dockerls.enable = true;
      bashls.enable = true;
      yamlls.enable = true;
    };
  };

  plugins = {
    lsp = {
      enable = true;
      keymaps = {
        silent = true;
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
          "<leader>ca" = "code_action";
        };
        diagnostic = {
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };
      };
    };

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
          gitsigns.enable = true;
          statix.enable = true;
          ts_node_action.enable = true;
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
    pkgs.nixpkgs-fmt # Changed from nixfmt to nixpkgs-fmt
  ];
}
