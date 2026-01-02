{
  programs.plasma = {
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    startup.startupScript = {
      steam.text = "steam -silent";
    };
    startup.startupScript = {
      dms.text = "dms run";
    };
  };
}
