{ pkgs, lib, ... }:
let
  theme = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "dracula-purple";
      publisher = "cbasdev";
      version = "1.5.2";
      sha256 = "sha256-l14xKOxkh4w0q+dEwGhT48COB/xdTYrm/R5GOHrLgDg=";
    };
  };
  vsc-ext = pkgs.vscode-extensions;
in
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = lib.importJSON (./settings.json);
      extensions = [
        vsc-ext.svelte.svelte-vscode
        vsc-ext.vue.volar
        vsc-ext.woberg.godot-dotnet-tools
        vsc-ext.vscodevim.vim
        vsc-ext.yoavbls.pretty-ts-errors
        vsc-ext.vscode-icons-team.vscode-icons
        vsc-ext.visualstudioexptteam.vscodeintellicode
        vsc-ext.vincaslt.highlight-matching-tag
        vsc-ext.visualstudiotoolsforunity.vstuc
        vsc-ext.esbenp.prettier-vscode
        vsc-ext.dbaeumer.vscode-eslint
        vsc-ext.astro-build.astro-vscode
        vsc-ext.bradlc.vscode-tailwindcss
        vsc-ext.shardulm94.trailing-spaces
        theme
      ];
    };
  };
}
