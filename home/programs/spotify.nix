{ pkgs
, inputs
, ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];
programs.spicetify =
   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
   in
   {
     enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
      enabledCustomApps = with spicePkgs.apps; [
        lyricsPlus
        marketplace
        newReleases
      ];
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
        trashbin
        goToSong
        listPlaylistsWithSong
        skipStats
        powerBar
        betterGenres
        loopyLoop
        history
      ];
    };
  }

  # allow spotify to be installed if you don't have unfree enabled already
  #nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #  "spotify"
  #];
