local status, everforest = pcall(require, 'everforest')
if (not status) then return end

everforest.setup({
  background = "hard",
  transparent_background_level = 1,
  italics = true,
  disable_italic_comments = false,
  sign_column_background = "none",
  ui_contrast = "low",
  dim_inactive_windows = false,
  diagnostic_text_highlight = true,
  diagnostic_virtual_text = "coloured",
  diagnostic_line_highlight = true,
  spell_foreground = false,
  show_eob = true,
  float_style = "bright",
  ---@param highlight_groups Highlights
  ---@param palette Palette
  on_highlights = function(highlight_groups, palette) end,
  ---@param palette Palette
  colours_override = function(palette) end,
})

everforest.load()
