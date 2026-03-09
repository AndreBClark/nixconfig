{ config, ... }:

let
  mkLink = target: {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/${target}";
  };
in
{
  home.file = {
    "config" = mkLink ".config";
    "local-share" = mkLink ".local/share";
  };
}
