{
  inputs,
  config,
  pkgs,
  ...
}:
{
  services.displayManager = {
    sddm.enable = false;
    dms-greeter = {
      enable = true;
      package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
      compositor.name = "niri";
      configFiles = [
        "/home/${config.home.username}/.config/DankMaterialShell/settings.json"
        # "/home/${username}}/.local/state/DankMaterialShell/session.json"
        # "/home/${username}/.cache/DankMaterialShell/dms-colors.json"
      ];
    };
  };
}
