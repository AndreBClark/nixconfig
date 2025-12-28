let
  inherit (import ../variables/default.nix) username keyboard;
in
{
  home = {
    inherit username keyboard;
    homeDirectory = "/home/${username}";
  };
}
