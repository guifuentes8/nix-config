{ lib, ... }:
{

  programs.firefox.profiles."guifuentes8" = {
    settings = lib.mkForce {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };
  };
}
