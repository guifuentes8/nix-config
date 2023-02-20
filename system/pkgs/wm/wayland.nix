{ pkgs, ... }:

let
  wf-recorder-master = pkgs.callPackage ../custom/wf-recorder.nix { };
in

{
  environment.systemPackages = (with pkgs; [
    wf-recorder-master
  ]);

  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.mpris ];
      };
    })
  ];
}
