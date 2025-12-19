{
  config,
  lib,
  ...
}:
{
  stylix = {
    enable = true;
    targets = {
      firefox.profileNames = lib.mkIf config.programs.firefox.enable [ "dev-edition-default" ];
    };
  };
}
