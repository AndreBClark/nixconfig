{ pkgs, config, ... }:
let
  nixConfigRepo = config.programs.nh.flake or "${config.home.homeDirectory}/nixconfig";
in
{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "dms-sync";
      text = ''
        install -Dm644 ~/.config/DankMaterialShell/settings.json \
          ${nixConfigRepo}/home/workspace/dms/settings.json
        echo "Settings synced to Nix config."
      '';
    })
  ];
}
