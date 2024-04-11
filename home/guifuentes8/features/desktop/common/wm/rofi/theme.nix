{ config, lib, configOptions, ... }:

let inherit (config.lib.formats.rasi) mkLiteral;
in {
  "*" = {
    border-radius = mkLiteral "${configOptions.styles.wm.borderRadius}";
    bg-col = mkLiteral "#${config.colorScheme.palette.base00}";
    bg-col-light = mkLiteral "#${config.colorScheme.palette.base00}";
    border-col = mkLiteral "#${config.colorScheme.palette.base00}";
    selected-col = mkLiteral "#${config.colorScheme.palette.base00}";
    blue = mkLiteral "#${config.colorScheme.palette.base0D}";
    fg-col = mkLiteral "#${config.colorScheme.palette.base05}";
    fg-col2 = mkLiteral "#${config.colorScheme.palette.base0B}";
    grey = mkLiteral "#${config.colorScheme.palette.base04}";
    font =
      "${configOptions.styles.font.main} ${configOptions.styles.font.size}";
  };

  "configuration" = {
    modi = "run,drun,window";
    icon-theme = configOptions.styles.icon.name;
    show-icons = true;
    drun-display-format = "{icon} {name}";
    location = 0;
    disable-history = false;
    hide-scrollbar = true;
    display-drun = "   Applications ";
    display-run = "   Run ";
    display-window = " 﩯  Window";
    display-Network = " 󰤨  Network";
    sidebar-mode = true;
  };

  "element-text, element-icon , mode-switcher" = {
    background-color = mkLiteral "inherit";
    text-color = mkLiteral "inherit";
  };

  "window" = {
    height = mkLiteral "350px";
    width = mkLiteral "600px";
    border = mkLiteral "${configOptions.styles.wm.borderWidth}";
    border-color = mkLiteral "#${config.colorScheme.palette.base0B}";
    background-color = mkLiteral "@bg-col";
  };

  "mainbox" = { background-color = mkLiteral "@bg-col"; };

  "inputbar" = {
    children = map mkLiteral [ "prompt" "entry" ];
    background-color = mkLiteral "@bg-col";
    border-radius = mkLiteral "${configOptions.styles.wm.borderWidth}";
    padding = mkLiteral "2px";
  };

  "prompt" = {
    background-color = mkLiteral "@blue";
    padding = mkLiteral "6px";
    text-color = mkLiteral "@bg-col";
    border-radius = mkLiteral "8px";
    margin = mkLiteral "20px 0px 0px 20px";
  };

  "textbox-prompt-colon" = {
    expand = false;
    str = ":";
  };

  "entry" = {
    padding = mkLiteral "6px";
    margin = mkLiteral "20px 0px 0px 10px";
    text-color = mkLiteral "@fg-col";
    background-color = mkLiteral "@bg-col";
  };

  "listview" = {
    border = mkLiteral "0px 0px 0px";
    padding = mkLiteral "6px 0px 0px";
    margin = mkLiteral "10px 0px 0px 20px";
    columns = 2;
    lines = 5;
    background-color = mkLiteral "@bg-col";
  };

  "element" = {
    padding = mkLiteral "5px";
    background-color = mkLiteral "@bg-col";
    text-color = mkLiteral "@fg-col";
  };

  "element-icon" = { size = mkLiteral "25px"; };

  "element selected" = {
    background-color = mkLiteral "@selected-col";
    text-color = mkLiteral " @fg-col2";
  };

  "mode-switcher" = { spacing = 0; };

  "button" = {
    padding = mkLiteral "10px";
    background-color = mkLiteral "@bg-col-light";
    text-color = mkLiteral "@grey";
    vertical-align = mkLiteral "0.5";
    horizontal-align = mkLiteral "0.5";
  };

  "button selected" = {
    background-color = mkLiteral "@bg-col";
    text-color = mkLiteral "@blue";
  };

  "message" = {
    background-color = mkLiteral "@bg-col-light";
    margin = mkLiteral "2px";
    padding = mkLiteral "2px";
    border-radius = mkLiteral "5px";
  };

  "textbox" = {
    padding = mkLiteral "6px";
    margin = mkLiteral "20 px 0 px 0 px 20px";
    text-color = mkLiteral "@blue";
    background-color = mkLiteral "@bg-col-light";
  };
}

