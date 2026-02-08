{ config, ... }:
{
  nix = {
    settings = {
      trusted-users = [
        config.username
        "admin"
      ];
      download-buffer-size = 524288000;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    extraOptions = "experimental-features = nix-command flakes";
  };
}
