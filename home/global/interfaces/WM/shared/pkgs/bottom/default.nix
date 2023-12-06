{ config, ... }:
{
  programs.bottom = {
    enable = true;
    settings = {
      colors = {
        table_header_color = "#${config.colorScheme.colors.base06}";
        all_cpu_color = "#${config.colorScheme.colors.base06}";
        avg_cpu_color = "#${config.colorScheme.colors.base0F}";
        cpu_core_colors = [ "#${config.colorScheme.colors.base08}" "#${config.colorScheme.colors.base09}" "#${config.colorScheme.colors.base0A}" "#${config.colorScheme.colors.base0B}" "#${config.colorScheme.colors.base0D}" "#${config.colorScheme.colors.base0E}" ];
        ram_color = "#${config.colorScheme.colors.base0B}";
        swap_color = "#${config.colorScheme.colors.base09}";
        rx_color = "#${config.colorScheme.colors.base0B}";
        tx_color = "#${config.colorScheme.colors.base08}";
        widget_title_color = "#${config.colorScheme.colors.base06}";
        border_color = "#${config.colorScheme.colors.base00}";
        highlighted_border_color = "#${config.colorScheme.colors.base0B}";
        text_color = "#${config.colorScheme.colors.base05}";
        graph_color = "#${config.colorScheme.colors.base04}";
        cursor_color = "#${config.colorScheme.colors.base0F}";
        selected_text_color = "#${config.colorScheme.colors.base02}";
        selected_bg_color = "#${config.colorScheme.colors.base0E}";
        high_battery_color = "#${config.colorScheme.colors.base0B}";
        medium_battery_color = "#${config.colorScheme.colors.base0A}";
        low_battery_color = "#${config.colorScheme.colors.base08}";
        gpu_core_colors = [ "#${config.colorScheme.colors.base0D}" "#${config.colorScheme.colors.base0E}" "#${config.colorScheme.colors.base08}" "#${config.colorScheme.colors.base09}" "#${config.colorScheme.colors.base0A}" "#${config.colorScheme.colors.base0B}" ];
        arc_color = "#${config.colorScheme.colors.base0C}";

        # table_header_color = "#${config.colorScheme.colors.base06}";
        # all_cpu_color = "#${config.colorScheme.colors.base06}";
        # avg_cpu_color = "#${config.colorScheme.colors.base06}";
        # cpu_core_colors = [
        #   "#${config.colorScheme.colors.base07}"
        #   "#${config.colorScheme.colors.base08}"
        #   "#${config.colorScheme.colors.base0A}"
        #   "#${config.colorScheme.colors.base0B}"
        #   "#${config.colorScheme.colors.base0D}"
        #   "#${config.colorScheme.colors.base0F}"
        # ];
        # ram_color = "#${config.colorScheme.colors.base09}";
        # swap_color = "#${config.colorScheme.colors.base09}";
        # rx_color = "#${config.colorScheme.colors.base09}";
        # tx_color = "#${config.colorScheme.colors.base09}";
        # widget_title_color = "#${config.colorScheme.colors.base0C}";
        # border_color = "#${config.colorScheme.colors.base06}";
        # highlighted_border_color = "#${config.colorScheme.colors.base0C}";
        # text_color = "#${config.colorScheme.colors.base07}";
        # graph_color = "#${config.colorScheme.colors.base09}";
        # cursor_color = "#${config.colorScheme.colors.base06}";
        # selected_text_color = "#${config.colorScheme.colors.base00}";
        # selected_bg_color = "#${config.colorScheme.colors.base0C}";
        # high_battery_color = "#${config.colorScheme.colors.base09}";
        # medium_battery_color = "#e5c890";
        # low_battery_color = "#e78284";
        # gpu_core_colors = [
        #   "#${config.colorScheme.colors.base07}"
        #   "#${config.colorScheme.colors.base08}"
        #   "#${config.colorScheme.colors.base0A}"
        #   "#${config.colorScheme.colors.base0B}"
        #   "#${config.colorScheme.colors.base0D}"
        #   "#${config.colorScheme.colors.base0F}"
        # ];
        # arc_color = "#${config.colorScheme.colors.base0C}";
      };
    };
  };
}
