{ username, ... }:
{
  nix = {
    settings = {
      trusted-users = [
        username
        "admin"
      ];
      download-buffer-size = 524288000;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      extra-substituters = [ "https://vicinae.cachix.org" ];
      extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];
    };
    extraOptions = "experimental-features = nix-command flakes";
  };
}
