{ ... }: {
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      name = "JetBrainsMonoNL Nerd Font";
      size = 13;
    };
    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      background_opacity = "0.9";
      confirm_os_window_close = 0;
      initial_window_width = 640;
      initial_window_height = 400;
    };
  };
}
