{
  programs.git.enable = true;
  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
