{ pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      andrec = {
        # TODO: You can set an initial password for your user.
        initialPassword = "yolo";
        shell = pkgs.fish;
        isNormalUser = true;
        # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
        # Be sure to change it (using passwd) after rebooting!
        #       openssh.authorizedKeys.keys = [
        #         # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
        #       ];
        # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
        extraGroups = [
          "greeter"
          "networkmanager"
          "wheel"
          "audio"
        ];
      };
    };
  };
}
