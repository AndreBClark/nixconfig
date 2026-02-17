{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.stevenblack-blocklist
  ];
  networking = {
    networkmanager.enable = true;
    stevenblack = {
      enable = true;
      block = [
        "fakenews"
        "gambling"
        "porn"
      ];
    };
  };
}
