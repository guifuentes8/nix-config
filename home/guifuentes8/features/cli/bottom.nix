{ config, ... }:
{
  programs.bottom = {
    enable = true;
    settings = {
      colors = {
        table_header_color = "#${config.colorScheme.palette.base06}";
        all_cpu_color = "#${config.colorScheme.palette.base06}";
        avg_cpu_color = "#${config.colorScheme.palette.base0F}";
        cpu_core_colors = [ "#${config.colorScheme.palette.base08}" "#${config.colorScheme.palette.base09}" "#${config.colorScheme.palette.base0A}" "#${config.colorScheme.palette.base0B}" "#${config.colorScheme.palette.base0D}" "#${config.colorScheme.palette.base0E}" ];
        ram_color = "#${config.colorScheme.palette.base0B}";
        swap_color = "#${config.colorScheme.palette.base09}";
        rx_color = "#${config.colorScheme.palette.base0B}";
        tx_color = "#${config.colorScheme.palette.base08}";
        widget_title_color = "#${config.colorScheme.palette.base06}";
        border_color = "#${config.colorScheme.palette.base00}";
        highlighted_border_color = "#${config.colorScheme.palette.base0B}";
        text_color = "#${config.colorScheme.palette.base05}";
        graph_color = "#${config.colorScheme.palette.base04}";
        cursor_color = "#${config.colorScheme.palette.base0F}";
        selected_text_color = "#${config.colorScheme.palette.base02}";
        selected_bg_color = "#${config.colorScheme.palette.base0D}";
        high_battery_color = "#${config.colorScheme.palette.base0B}";
        medium_battery_color = "#${config.colorScheme.palette.base0A}";
        low_battery_color = "#${config.colorScheme.palette.base08}";
        gpu_core_colors = [ "#${config.colorScheme.palette.base0D}" "#${config.colorScheme.palette.base0E}" "#${config.colorScheme.palette.base08}" "#${config.colorScheme.palette.base09}" "#${config.colorScheme.palette.base0A}" "#${config.colorScheme.palette.base0B}" ];
        arc_color = "#${config.colorScheme.palette.base0C}";

        # table_header_color = "#${config.colorScheme.palette.base06}";
        # all_cpu_color = "#${config.colorScheme.palette.base06}";
        # avg_cpu_color = "#${config.colorScheme.palette.base06}";
        # cpu_core_colors = [
        #   "#${config.colorScheme.palette.base07}"
        #   "#${config.colorScheme.palette.base08}"
        #   "#${config.colorScheme.palette.base0A}"
        #   "#${config.colorScheme.palette.base0B}"
        #   "#${config.colorScheme.palette.base0D}"
        #   "#${config.colorScheme.palette.base0F}"
        # ];
        # ram_color = "#${config.colorScheme.palette.base09}";
        # swap_color = "#${config.colorScheme.palette.base09}";
        # rx_color = "#${config.colorScheme.palette.base09}";
        # tx_color = "#${config.colorScheme.palette.base09}";
        # widget_title_color = "#${config.colorScheme.palette.base0C}";
        # border_color = "#${config.colorScheme.palette.base06}";
        # highlighted_border_color = "#${config.colorScheme.palette.base0C}";
        # text_color = "#${config.colorScheme.palette.base07}";
        # graph_color = "#${config.colorScheme.palette.base09}";
        # cursor_color = "#${config.colorScheme.palette.base06}";
        # selected_text_color = "#${config.colorScheme.palette.base00}";
        # selected_bg_color = "#${config.colorScheme.palette.base0C}";
        # high_battery_color = "#${config.colorScheme.palette.base09}";
        # medium_battery_color = "#e5c890";
        # low_battery_color = "#e78284";
        # gpu_core_colors = [
        #   "#${config.colorScheme.palette.base07}"
        #   "#${config.colorScheme.palette.base08}"
        #   "#${config.colorScheme.palette.base0A}"
        #   "#${config.colorScheme.palette.base0B}"
        #   "#${config.colorScheme.palette.base0D}"
        #   "#${config.colorScheme.palette.base0F}"
        # ];
        # arc_color = "#${config.colorScheme.palette.base0C}";
      };
    };
  };
}
