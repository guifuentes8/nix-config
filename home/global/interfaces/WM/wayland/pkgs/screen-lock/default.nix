{ pkgs, outputs, config, ... }:
let
  my-config = outputs.packages.${pkgs.system}.my-config;
  screen-locker = pkgs.writeShellScript "script" ''
    ${pkgs.swaylock}/bin/swaylock --image ${my-config}/share/wallpapers/lock.jpg --beep --nofork --fill --indicator --ignore-empty-password --clock --line-uses-ring --radius=300 --ring-width=18.0 --inside-color=#${config.colorScheme.colors.base00}AA --ring-color=#${config.colorScheme.colors.base0E}FF --insidever-color=#${config.colorScheme.colors.base00}AA --ringver-color=#${config.colorScheme.colors.base0C}FF --insidewrong-color=#${config.colorScheme.colors.base00}AA --ringwrong-color=#${config.colorScheme.colors.base08}FF --keyhl-color=#${config.colorScheme.colors.base0A}FF --bshl-color=#${config.colorScheme.colors.base0C}FF --separator-color=#00000000 --verif-color=#${config.colorScheme.colors.base0C}FF --wrong-color=#${config.colorScheme.colors.base08}FF --modif-color=#${config.colorScheme.colors.base0A}FF --date-color=#${config.colorScheme.colors.base0C}FF --time-color=#${config.colorScheme.colors.base0C}FF --time-str="%H:%M:%S" --date-str="Hoje é %A, dia %d/%m/%Y." --verif-text="Analyzing..." --wrong-text="Password error!" --noinput-text="None!" --lock-text="Locking screen..." --lockfailed-text="Lock failed!"  --time-align=0 --date-align=0 --time-font="JetBrainsMonoNL Nerd Font" --date-font="JetBrainsMonoNL Nerd Font" --verif-font="JetBrainsMonoNL Nerd Font" --wrong-font="JetBrainsMonoNL Nerd Font" --time-size=48 --date-size=24 --verif-size=32 --wrong-size=32 --date-pos="tx:ty+50"
  '';
in
{
  services.screen-locker = {
    enable = true;
    inactiveInterval = 10;
    lockCmd = "${screen-locker}";
  };

}

