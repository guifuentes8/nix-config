{ pkgs, config, ... }: {
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
    settings = {
      PASSWORD_STORE_DIR = "$HOME/nix-config/.password-store";
    };
  };
  #services.pass-secret-service = {
  ###  enable = true;
  #storePath = "$HOME/nix-config/.password-store";
  #};

}
