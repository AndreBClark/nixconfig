{ lib, ... }:
{
  programs.plasma = {
    powerdevil = {
      AC = {
        powerButtonAction = lib.mkForce "nothing";
        autoSuspend = {
          action = "sleep";
          idleTimeout = 60 * 60;
        };
        whenSleepingEnter = "standbyThenHibernate";
      };
    };
  };
}
