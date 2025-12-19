{
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "sky";
      font = "JetBrainsMono Nerd Font";
      fontSize = "16";
      background = "${../fallingfrontier.jpg}";
      loginBackground = true;
    })
  ];
  services.displayManager.sddm = {
    enable = lib.mkDefault true;
    wayland.enable = true;
    theme = "catppuccin-mocha-sky";
    package = lib.mkForce pkgs.kdePackages.sddm;
  };
}
