{
  lib,
  ...
}:
{
  imports = [ ./config.nix ];

  programs.git.enable = lib.mkForce true;

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };

  home.stateVersion = lib.mkForce "24.05";
}
