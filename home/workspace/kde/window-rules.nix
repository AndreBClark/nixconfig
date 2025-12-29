{
  programs.plasma = {
    window-rules = [
      {
        apply.noborder = {
          value = true;
          apply = "force";
        };
        description = "Hide titlebar by default";
        match = {
          window-class = {
            value = ".*";
            type = "regex";
          };
          window-types = [ "normal" ];
        };
      }
      {
        apply.above = "force";
        description = "Show Picture in Picture above all";
        match.title = {
          value = "Picture in picture";
          type = "exact";
        };
      }
    ];
  };
}
