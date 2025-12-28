let
  inherit (import ../variables/default.nix) keyboard;
in
with keyboard;
{
  services.xserver = {
    xkb.layout = layout;
    xkbOptions = options;
  };
}
