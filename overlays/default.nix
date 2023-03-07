{ outputs, inputs }:

{
  overlay = final: prev: {

    mpv = prev.mpv.override {
      scripts = [ prev.mpvScripts.mpris ];
    };

    waybar = prev.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });

    wf-recorder = prev.wf-recorder.overrideAttrs (prev: {
      version = "git";
      src = final.pkgs.fetchFromGitHub {
        owner = "ammen99";
        repo = "wf-recorder";
        rev = "460d454b1efd380a3f732f6fd70c7a5e265381f6";
        sha256 = "sha256-FTlAuqjOrtvjVXH3wiLlANdguys+Zzeo/QJgjbIh3LM=";
      };
    });

    yarn = prev.yarn.override {
      nodejs = pkgs.nodejs-16_x;
    };

  };
}
