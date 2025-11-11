{ pkgs
, inputs
, ...
}:
  let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  in {
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];
  programs.spicetify = {
     enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
      enabledCustomApps = with spicePkgs.apps; [
        betterLibrary
        localFiles
        newReleases
        marketplace
      ];
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
        trashbin
        goToSong
        listPlaylistsWithSong
        skipStats
        songStats
        powerBar
        betterGenres
#         loopyLoop
        history
        playNext
        # sectionMarker makes progressbar illegible with catpuccin theme
        oldLikeButton
      ];
    };
}
