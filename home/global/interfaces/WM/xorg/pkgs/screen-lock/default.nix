{ pkgs, outputs, config, ... }:
let
  my-config = outputs.packages.${pkgs.system}.my-config;
  screen-locker = pkgs.writeShellScript "script" ''
    ${pkgs.i3lock-color}/bin/i3lock --image ${my-config}/wallpapers/lock.jpg --beep --nofork --fill --indicator --ignore-empty-password --clock --line-uses-ring --radius=300 --ring-width=18.0 --inside-color=#${config.colorScheme.colors.base01}AA --ring-color=#${config.colorScheme.colors.base0E}FF --insidever-color=#${config.colorScheme.colors.base01}AA --ringver-color=#${config.colorScheme.colors.base0D}FF --insidewrong-color=#${config.colorScheme.colors.base01}AA --ringwrong-color=#${config.colorScheme.colors.base0B}FF --keyhl-color=#${config.colorScheme.colors.base08}FF --bshl-color=#${config.colorScheme.colors.base0A}FF --separator-color=#00000000 --verif-color=#${config.colorScheme.colors.base0D}FF --wrong-color=#${config.colorScheme.colors.base0B}FF --modif-color=#${config.colorScheme.colors.base08}FF --date-color=#${config.colorScheme.colors.base0A}FF --time-color=#${config.colorScheme.colors.base0D}FF --time-str="%H:%M:%S" --date-str="Hoje é %A, dia %d/%m/%Y." --verif-text="Analyzing..." --wrong-text="Password error!" --noinput-text="None!" --lock-text="Locking screen..." --lockfailed-text="Lock failed!"  --time-align=0 --date-align=0 --time-font="JetBrainsMonoNL Nerd Font" --date-font="JetBrainsMonoNL Nerd Font" --verif-font="JetBrainsMonoNL Nerd Font" --wrong-font="JetBrainsMonoNL Nerd Font" --time-size=48 --date-size=24 --verif-size=32 --wrong-size=32 --date-pos="tx:ty+50"
  '';
in
{
  services.screen-locker = {
    enable = true;
    inactiveInterval = 1;
    lockCmd = "${screen-locker}";
  };

}

