local mainMod = "SUPER"
local noctCall = "noctalia msg "
local launchCall = "uwsm app -- "

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

-- Window manipulation
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + F11", hl.dsp.window.fullscreen({ mode = 1 }))

-- Change active window
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + CONTROL + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + CONTROL + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + CONTROL + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + CONTROL + J", hl.dsp.focus({ direction = "down" }))

hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd(noctCall .. "window-switcher"))

-- Move active window between workspaces
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + CONTROL + SHIFT + Left", hl.dsp.window.move({ workspace = "m-1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Right", hl.dsp.window.move({ workspace = "m+1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "m+1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "m-1" }))

-- Move & resize active window with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Move & resize active window with keyboard
hl.bind(mainMod .. " + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))

hl.bind(mainMod .. " + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind(mainMod .. " + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

------------------
---- LAUNCHER ----
------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(launchCall .. TERMINAL))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(launchCall .. TERMINAL))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(launchCall .. FILE_MANAGER))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(launchCall .. EDITOR))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(launchCall .. CALCULATOR))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(launchCall .. BROWSER))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(launchCall .. BROWSER .. " --private-window"))

------------------
----- PANEL ------
------------------

hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(noctCall .. "settings-toggle"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(noctCall .. "panel-toggle baizhu/asus-gpu-mode:gpu-mode-panel"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(noctCall .. "session lock"))

hl.bind(mainMod .. " + Period", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"))
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd(noctCall .. "bar-toggle default"))
hl.bind(mainMod .. " + CONTROL + SHIFT + SPACE", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"))
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd(noctCall .. "session shutdown"))

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- System
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"), { locked = true })

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctCall .. "volume-mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctCall .. "mic-mute"), { locked = true })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctCall .. "media next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctCall .. "brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down"), { locked = true, repeating = true })

-- Calculator
hl.bind("XF86Calculator", hl.dsp.exec_cmd(launchCall .. CALCULATOR))

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
hl.bind("Print", hl.dsp.exec_cmd(noctCall .. "screenshot-region"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(noctCall .. "screenshot-fullscreen"))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("hyprpicker -a -n"))

-- Theming and Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"))

-- Notifications
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center notifications"))

-------------------------------
---- WORKSPACES & MONITORS ----
-------------------------------

-- Change active workspace
for i = 1, 10 do
	hl.bind(mainMod .. " + code:" .. i + 9, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + code:" .. i + 9, hl.dsp.window.move({ workspace = i }))
end

-- Move to adjacent workspaces and next empty on a given monitor
hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + CONTROL + Left", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.focus({ workspace = "emptym" }))

-- Scroll through existing workspaces & monitors
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + CONTROL + mouse_up", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + CONTROL + mouse_down", hl.dsp.focus({ workspace = "m+1" }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special())
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special" }))
