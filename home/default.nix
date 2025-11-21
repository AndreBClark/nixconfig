{
  lib,
  username,
  ...
}:
{
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = lib.mkForce "24.05";
  };
  programs.git.enable = lib.mkForce true;

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };
}
