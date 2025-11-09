{pkgs}: {
  environment.systemPackages = with pkgs; [
    stevenblack-blocklist
  ];
  networking = {
    networkmanager.enable = true;
    stevenblack = {
      enable = true;
      block = [ "fakenews" "gambling" "porn" ];
    };
  };
}