{
  nix = {
    settings = {
      download-buffer-size = 524288000;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    extraOptions = "experimental-features = nix-command flakes";
    };
}
