{ pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "AndreBClark";
    userEmail = "andre@cosmicdivision.dev";
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = true;
      };
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = false;
  };
  programs.git.extraConfig.credential = {
    "https://github.com" = {
      helper = "!gh auth git-credential";
    };
    "https://gist.github.com" = {
      helper = "!gh auth git-credential";
    };
  };
}