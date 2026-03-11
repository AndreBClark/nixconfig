{ lib, ... }:
{
  services.easyeffects = {
    enable = true;
    extraPresets = {
      NPR = lib.importJSON (./Masc_NPR_VOICE.json);
      Military = lib.importJSON (./Military_Comm.json);
    };
  };
}
