{
  inputs,
  config,
  pkgs,
  ...
}:
let
  inherit (import ../variables/default.nix) username;
in
{
  services.displayManager = {
    sddm.enable = false;
    dms-greeter = {
      enable = true;
      package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
      compositor.name = "niri";
      configFiles = [
        "/home/${username}}/.config/DankMaterialShell/settings.json"
        # "/home/${username}}/.local/state/DankMaterialShell/session.json"
        # "/home/${username}/.cache/DankMaterialShell/dms-colors.json"
      ];
    };
  };
}
