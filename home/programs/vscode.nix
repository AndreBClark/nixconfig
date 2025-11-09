{
  pkgs,
  lib,
  ...
}: let
    theme = (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
      mktplcRef = {
        name = "dracula-purple";
        publisher = "cbasdev";
        version = "1.5.2";
        sha256 = "sha256-l14xKOxkh4w0q+dEwGhT48COB/xdTYrm/R5GOHrLgDg=";
      };
    });
in {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = lib.importJSON(./settings.json);
      extensions = with pkgs.vscode-extensions; [
        svelte.svelte-vscode
        vue.volar
#         ms-dotnettools.csharp
#         ms-dotnettools.vscode-dotnet-runtime
#         ms-dotnettools.vscodeintellicode-csharp
#         ms-dotnettools.csdevkit
        woberg.godot-dotnet-tools
        vscodevim.vim
        yoavbls.pretty-ts-errors
        vscode-icons-team.vscode-icons
        visualstudioexptteam.vscodeintellicode
        vincaslt.highlight-matching-tag
        visualstudiotoolsforunity.vstuc
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint
        astro-build.astro-vscode
        bradlc.vscode-tailwindcss
        shardulm94.trailing-spaces
        theme
      ];
    };
  };
}
