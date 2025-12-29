{
  programs.plasma = {
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    startup.startupScript = {
      steam.text = "steam -silent";
    };
  };
}
