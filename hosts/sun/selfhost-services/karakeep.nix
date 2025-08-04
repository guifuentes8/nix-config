{ pkgs, lib, ... }: {
  services.karakeep = {
    enable = true;
    browser = { enable = true; };
    extraEnvironment = {
      PORT = "9109";
      DISABLE_SIGNUPS = "false";
      DISABLE_NEW_RELEASE_CHECK = "true";
    };

  };
}
