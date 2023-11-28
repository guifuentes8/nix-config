{ pkgs, ... }:
let
  screen-locker = pkgs.writeShellScript "script" ''
    ${pkgs.i3lock-color}/bin/i3lock --image /home/guifuentes8/nix-config/home/shared/wallpapers/images/world-map.png --beep --nofork --fill --indicator --ignore-empty-password --clock --line-uses-ring --radius=300 --ring-width=18.0 --inside-color=#17191eAA --ring-color=#8265ffFF --insidever-color=#17191eAA --ringver-color=#85ffe0FF --insidewrong-color=#17191eAA --ringwrong-color=#ff3d81FF --keyhl-color=#ff29a8FF --bshl-color=#f0ffaaFF --separator-color=#00000000 --verif-color=#85ffe0FF --wrong-color=#ff3d81FF --modif-color=#85ffe0FF --date-color=#85ffe0FF --time-color=#85ffe0FF --time-str="%H:%M:%S" --date-str="Hoje é %A, dia %d/%m/%Y." --verif-text="Analyzing..." --wrong-text="Password error!" --noinput-text="None!" --lock-text="Locking screen..." --lockfailed-text="Lock failed!"  --time-align=0 --date-align=0 --time-font="JetBrainsMonoNL Nerd Font" --date-font="JetBrainsMonoNL Nerd Font" --verif-font="JetBrainsMonoNL Nerd Font" --wrong-font="JetBrainsMonoNL Nerd Font" --time-size=48 --date-size=24 --verif-size=32 --wrong-size=32 --date-pos="tx:ty+50"
  '';
in
{
  services.screen-locker = {
    enable = true;
    inactiveInterval = 10;
    xautolock.enable = true;
    xautolock.detectSleep = true;
    lockCmd = "${screen-locker}";
  };
  services.xidlehook.not-when-audio = true;
  services.xidlehook.not-when-fullscreen = true;
}

