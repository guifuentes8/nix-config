local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                                                                                                     ad88888ba ]],
  [[                               ,dPYb,                                       I8                      d8"     "8b]],
  [[                               IP'`Yb                                       I8                      88       88]],
  [[                          gg   I8  8I                                    88888888                   Y8a     a8P]],
  [[                          ""   I8  8'                                       I8                       "Y8aaa8P" ]],
  [[   ,gggg,gg  gg      gg   gg   I8 dP   gg      gg   ,ggg,    ,ggg,,ggg,     I8     ,ggg,     ,g,     ,d8"""8b, ]],
  [[  dP"  "Y8I  I8      8I   88   I8dP    I8      8I  i8" "8i  ,8" "8P" "8,    I8    i8" "8i   ,8'8,   d8"     "8b]],
  [[ i8'    ,8I  I8,    ,8I   88   I8P     I8,    ,8I  I8, ,8I  I8   8I   8I   ,I8,   I8, ,8I  ,8'  Yb  88       88]],
  [[,d8,   ,d8I ,d8b,  ,d8b,_,88,_,d8b,_  ,d8b,  ,d8b, `YbadP' ,dP   8I   Yb, ,d88b,  `YbadP' ,8'_   8) Y8a     a8P]],
  [[P"Y8888P"8888P'"Y88P"`Y88P""Y8PI8"88888P'"Y88P"`Y8888P"Y8888P'   8I   `Y888P""Y88888P"Y888P' "YY8P8P "Y88888P" ]],
  [[       ,d8I'                   I8 `8,                                                                          ]],
  [[     ,dP'8I                    I8  `8,                                                                         ]],
  [[    ,8"  8I                    I8   8I                                                                         ]],
  [[    I8   8I                    I8   8I                                                                         ]],
  [[    `8, ,8I                    I8, ,8'                                                                         ]],
  [[     `Y8P"                      "Y8P'                                                                          ]],
}
dashboard.section.buttons.val = {
  dashboard.button("n", "󰈔 New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "󰈞 Find file", ":Telescope find_files <CR>"),
  dashboard.button("o", "󱋡 Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("s", "󰈙 Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", " Configuration", ":e ~/.config/nvim/init.vim<CR>"),
  dashboard.button("q", "󰅚 Quit Neovim", ":qa<CR>"),
}

local function footer()
  return require("alpha.fortune")
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Keyword"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
