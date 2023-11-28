local wezterm = require 'wezterm'
if wezterm.config_builder then
    config = wezterm.config_builder()
  end
      return {
        hide_tab_bar_if_only_one_tab = true,
        default_cursor_style = "BlinkingBar",
        font = wezterm.font('Dank Mono', { style = 'Italic' }),
        font_size=13.0,
        color_scheme = "Catppuccin Mocha", -- or Macchiato, Mocha, Latte
        window_background_opacity = 0.9
      }