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
  xdg.dataFile."mime/packages/inode-directory.xml".text = ''
    <?xml version="1.0" encoding="utf-8"?>
    <mime-type xmlns="http://www.freedesktop.org/standards/shared-mime-info" type="inode/directory">
      <comment>Folder</comment>
      <icon name="folder"/>
      <glob-deleteall/>
    </mime-type>
  '';
  home.activation.createDirectories = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${lib.concatMapStringsSep "\n" (dir: ''
      run mkdir -p ${homeDir}/${dir.path}
    '') directories}
  '';

  home.file = lib.listToAttrs (map mkDirectoryFile directories);
}
