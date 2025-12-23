{
  lib,
  config,
  ...
}:
{
  stylix = {
    targets = {
      firefox.profileNames = lib.mkIf config.programs.firefox.enable [ "dev-edition-default" ];
      nixvim.plugin = "base16-nvim";
    };
  };
}
