{ pkgs, ...}:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "AndreBClark";
        email = "andre@cosmicdivision.dev";
      };
      credential = {
        "https:github.com" = {
          helper = "!gh auth git-credential";
        };
        "https://gist.github.com" = {
          helper = "!gh auth git-credential";
        };
        helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
      };
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = true;
      };
    };
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = false;
  };

}
