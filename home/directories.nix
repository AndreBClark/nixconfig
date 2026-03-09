{
  config,
  lib,
  ...
}:
let
  homeDir = config.home.homeDirectory;

  directories = [
    {
      path = "vaults";
      icon = "folder-obsidian";
    }
    {
      path = "repos";
      icon = "folder-github";
    }
  ];

  # Helper function to generate .directory file attributes
  mkDirectoryFile = dir: {
    name = "${homeDir}/${dir.path}/.directory";
    value = {
      text = ''
        [Desktop Entry]
        Icon=${dir.icon}
      '';
    };
  };
in
{
  home.activation.createDirectories = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${lib.concatMapStringsSep "\n" (dir: ''
      run mkdir -p ${homeDir}/${dir.path}
    '') directories}
  '';

  home.file = lib.listToAttrs (map mkDirectoryFile directories);
}
