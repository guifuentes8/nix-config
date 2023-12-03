{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcalcli
  ];
  home.file.".gcalclirc" = {
    enable = true;
    text = ''
      --calendar=guifuentes8@gmail.com
      --client-id=${pkgs.pass}/bin/pass show gcalcli/id
      --client-secret=${pkgs.pass}/bin/pass show gcalcli/secret
    '';
  };
}
