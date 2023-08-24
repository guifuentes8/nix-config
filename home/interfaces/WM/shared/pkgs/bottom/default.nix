{ config, ... }:
{
  programs.bottom = {
    enable = true;
    settings = {
      colors = {
        table_header_color = "#${config.colorScheme.colors.base0E}";
        all_cpu_color = "#${config.colorScheme.colors.base0E}";
        avg_cpu_color = "#${config.colorScheme.colors.base0E}";
        cpu_core_colors = [
          "#${config.colorScheme.colors.base08}"
          "#${config.colorScheme.colors.base0F}"
          "#${config.colorScheme.colors.base0A}"
          "#${config.colorScheme.colors.base09}"
          "#${config.colorScheme.colors.base0D}"
          "#${config.colorScheme.colors.base0B}"
        ];
        ram_color = "#${config.colorScheme.colors.base0A}";
        swap_color = "#${config.colorScheme.colors.base0F}";
        rx_color = "#${config.colorScheme.colors.base0A}";
        tx_color = "#${config.colorScheme.colors.base08}";
        widget_title_color = "#${config.colorScheme.colors.base00}";
        border_color = "#${config.colorScheme.colors.base0E}";
        highlighted_border_color = "#${config.colorScheme.colors.base00}";
        text_color = "#${config.colorScheme.colors.base07}";
        graph_color = "#${config.colorScheme.colors.base06}";
        cursor_color = "#${config.colorScheme.colors.base0E}";
        selected_text_color = "#${config.colorScheme.colors.base02}";
        selected_bg_color = "#${config.colorScheme.colors.base00}";
        high_battery_color = "#${config.colorScheme.colors.base0A}";
        medium_battery_color = "#e5c890";
        low_battery_color = "#e78284";
        gpu_core_colors = [
          "#${config.colorScheme.colors.base08}"
          "#${config.colorScheme.colors.base0F}"
          "#${config.colorScheme.colors.base0A}"
          "#${config.colorScheme.colors.base09}"
          "#${config.colorScheme.colors.base0D}"
          "#${config.colorScheme.colors.base0B}"
        ];
        arc_color = "#${config.colorScheme.colors.base00}";
      };
    };
  };
}
