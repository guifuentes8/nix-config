{ config, lib, ... }:

let
  # Use `mkLiteral` for string-like values that should show without
  # quotes, e.g.:
  # {
  #   foo = "abc"; => foo: "abc";
  #   bar = mkLiteral "abc"; => bar: abc;
  # };
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  "*" = {
    border-radius = mkLiteral "8px";
    bg-col = mkLiteral "#1a1b26";
    bg-col-light = mkLiteral "#1a1b26";
    border-col = mkLiteral "#1a1b26";
    selected-col = mkLiteral "#1a1b26";
    blue = mkLiteral "#7dcfff";
    fg-col = mkLiteral "#c0caf5";
    fg-col2 = mkLiteral "#9ece6a";
    grey = mkLiteral "#9aa5ce";
    width = "100px";
    font = "JetBrainsMonoNL Nerd Font 13";
  };

  "configuration" = {
    modi = mkLiteral "run,drun,window";
    icon-theme = mkLiteral "Oranchelo";
    show-icons = true;
    terminal = mkLiteral "alacritty";
    drun-display-format = mkLiteral "{icon} {name}";
    location = 0;
    disable-history = false;
    hide-scrollbar = true;
    display-drun = mkLiteral "   Apps ";
    display-run = mkLiteral "   Run ";
    display-window = mkLiteral " 﩯  Window";
    display-Network = mkLiteral " 󰤨  Network";
    sidebar-mode = true;
  };

  "element-text, element-icon , mode-switcher" = {
    background-color = mkLiteral "inherit";
    text-color = mkLiteral "inherit";
  };

  "window" = {
    height = mkLiteral "600px";
    border = mkLiteral "2px";
    border-color = mkLiteral "#73daca";
    background-color = mkLiteral "@bg-col";
  };

  "mainbox" = {
    background-color = mkLiteral "@bg-col";
  };

  "inputbar" = {
    children = map mkLiteral [ "prompt" "entry" ];
    background-color = "@bg-col";
    border-radius = "8px";
    padding = "2px";
  };

  "prompt" = {
    background-color = "@blue";
    padding = "6px";
    text-color = "@bg-col";
    border-radius = "8px";
    margin = "20px 0px 0px 20px";
  };

  "textbox-prompt-colon" = {
    expand = false;
    str = "=";
  };

  "entry" = {
    padding = "6px";
    margin = "20px 0px 0px 10px";
    text-color = "@fg-col";
    background-color = "@bg-col";
  };

  "listview" = {
    border = "0px 0px 0px";
    padding = "6px 0px 0px";
    margin = "10px 0px 0px 20px";
    columns = 2;
    lines = 5;
    background-color = "@bg-col";
  };

  "element" = {
    padding = "5px";
    background-color = "@bg-col";
    text-color = "@fg-col";
  };

  "element-icon" = {
    size = "25px";
  };

  "element selected" = {
    background-color = "@selected-col";
    text-color = " @fg-col2";
  };

  "mode-switcher" = {
    spacing = 0;
  };

  "button" = {
    padding = "10px";
    background-color = "@bg-col-light";
    text-color = "@grey";
    vertical-align = mkLiteral "0.5";
    horizontal-align = mkLiteral "0.5";
  };

  "button selected" = {
    background-color = "@bg-col";
    text-color = "@blue";
  };

  "message" = {
    background-color = "@bg-col-light";
    margin = "2px";
    padding = "2px";
    border-radius = "5px";
  };

  "textbox" = {
    padding = "6px";
    margin = "20 px 0 px 0 px 20px";
    text-color = "@blue";
    background-color = "@bg-col-light";
  };
}

