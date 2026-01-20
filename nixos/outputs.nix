{
  services.autorandr = {
    enable = true;
    profiles = {
      both = {
        config = {
          DP-2 = {
            enable = true;
            primary = true;
            mode = "2560x1440";
            rate = "60.00";
            position = "1920x0";
          };
          HDMI-A-1 = {
            enable = true;
            primary = false;
            mode = "1920x1080";
            rate = "60.00";
            position = "0x720";
          };
        };
      };
    };
  };
}
