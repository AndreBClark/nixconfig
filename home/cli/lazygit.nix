{ pkgs, lib, ... }:
{
  programs.lazygit = {
    enable = true;
    enableFishIntegration = lib.mkDefault true;
    settings = {
      gui = {
        mouseEvents = false;
        showFileTree = true;
        nerdFontsVersion = "3";
        showFileIcons = true;
        skipDiscardChangeWarning = true;
      };
      git = {
        pagers = [
          { pager = "delta --paging=never --dark --line-numbers --hyperlinks"; }
        ];
        autoFetch = false;
        diffContextSize = 5;
        parseEmoji = true;
        mainBranches = [
          "main"
          "master"
        ];
        skipHookPrefix = "WIP";
        commit = {
          autoWrapCommitMessage = true;
          autoWrapWidth = 72;
          signOff = false;
        };
      };
    };
  };
  home.packages = [
    pkgs.delta
  ];
}
