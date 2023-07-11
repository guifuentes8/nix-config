{ pkgs, ... }:
let
  my-python-packages = ps: with ps; [
    pip
    setuptools
    torch
    openai-whisper
    srt
    # other python packages
  ];
in
{
  environment.systemPackages = [
    (pkgs.python3.withPackages my-python-packages)
  ];
}
