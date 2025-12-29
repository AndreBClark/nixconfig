let
  inherit (import ../variables/default.nix) keyboard;
in
{
  services.xserver = {
    xkb = {
      inherit (keyboard) layout options model;
    };
  };
}
