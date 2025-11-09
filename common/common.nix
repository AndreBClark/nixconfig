{
  pkgs,
  lib,
  ...
}:
{
  programs.command-not-found.enable = false;
  programs.bash.interactiveShellInit = ''
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
  '';

  environment.systemPackages = with pkgs; [
    pciutils
    envsubst
    stevenblack-blocklist
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "sky";
      font  = "JetBrainsMono Nerd Font";
      fontSize = "18";
      background = "${../fallingfrontier.jpg}";
      loginBackground = true;
    })
  ];
  programs.dconf.enable = true;

  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };
services.displayManager.sddm = {
  enable = true;
  wayland.enable = true;
  theme = "catppuccin-mocha-sky";
  package = lib.mkForce pkgs.kdePackages.sddm;
};

  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # This variable fixes electron apps in wayland
  networking = {
    networkmanager.enable = true;
    stevenblack = {
      enable = true;
      block = [ "fakenews" "gambling" "porn" ];
    };
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Enable networking

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
