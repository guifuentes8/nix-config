{ config, ... }:
{
  programs.bottom = {
    enable = true;
    settings = {
      colors = {
        table_header_color = "#f5e0dc";
        all_cpu_color = "#f5e0dc";
        avg_cpu_color = "#eba0ac";
        cpu_core_colors = [ "#f38ba8" "#fab387" "#f9e2af" "#a6e3a1" "#74c7ec" "#cba6f7" ];
        ram_color = "#a6e3a1";
        swap_color = "#fab387";
        rx_color = "#a6e3a1";
        tx_color = "#f38ba8";
        widget_title_color = "#f2cdcd";
        border_color = "#585b70";
        highlighted_border_color = "#f5c2e7";
        text_color = "#cdd6f4";
        graph_color = "#a6adc8";
        cursor_color = "#f5c2e7";
        selected_text_color = "#11111b";
        selected_bg_color = "#cba6f7";
        high_battery_color = "#a6e3a1";
        medium_battery_color = "#f9e2af";
        low_battery_color = "#f38ba8";
        gpu_core_colors = [ "#74c7ec" "#cba6f7" "#f38ba8" "#fab387" "#f9e2af" "#a6e3a1" ];
        arc_color = "#89dceb";

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
