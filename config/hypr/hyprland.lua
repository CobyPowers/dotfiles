dofile(os.getenv("HOME") .. "/.local/share/dotfiles/default/hypr/bootstrap.lua")

require("default.hypr.init")

-- For Noctalia Color templates
require("noctalia").apply_theme()
