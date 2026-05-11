local mainMod = "SUPER"
local terminal = "ghostty"
local menu = "rofi -show run -theme nord.rasi"
local switcher =
	[[hyprctl clients | awk '/title: ./ { gsub("\t*title: *", ""); print}' | rofi -dmenu -theme nord.rasi | xargs -I{} hyprctl dispatch focuswindow "title:{}"]]
local toggle_bar = "killall waybar || waybar"
local screen_shot = "/home/defalse/.Null/Devs/myScripts/screenshot.sh"

local bind = hl.bind
local exec_cmd = hl.dsp.exec_cmd
local focus = hl.dsp.focus
local window = hl.dsp.window
local workspace = hl.dsp.workspace
local group = hl.dsp.group

bind(mainMod .. " + SHIFT + return", exec_cmd(terminal))

local closeWindowBind = bind(mainMod .. " + SHIFT + C", window.close())

closeWindowBind:set_enabled(true)

bind(
	mainMod .. " + SHIFT + backslash",
	exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

bind(mainMod .. " + m", window.float({ action = "toggle" }))
bind(mainMod .. " + space", exec_cmd(menu))
bind(mainMod .. " + n", exec_cmd(switcher))
bind(mainMod .. " + b", exec_cmd(toggle_bar))

bind(mainMod .. " + Print", exec_cmd(screen_shot .. " d"))
bind(mainMod .. " + SHIFT + Print", exec_cmd(screen_shot .. " s"))
bind(mainMod .. " + CTRL + Print", exec_cmd(screen_shot .. " w"))

bind(mainMod .. " + P", window.pseudo())
bind(mainMod .. " + V", hl.dsp.layout("togglesplit"))
bind(mainMod .. " + SHIFT + F", window.fullscreen({ mode = "fullscreen", action = "toggle" })) -- dwindle only

bind(mainMod .. " + h", focus({ direction = "left" }))
bind(mainMod .. " + SHIFT + h", window.move({ direction = "l" }))
bind(mainMod .. " + ALT + h", window.swap({ direction = "l" }))
bind(mainMod .. " + l", focus({ direction = "right" }))
bind(mainMod .. " + SHIFT + l", window.move({ direction = "r" }))
bind(mainMod .. " + ALT + l", window.swap({ direction = "r" }))
bind(mainMod .. " + k", focus({ direction = "up" }))
bind(mainMod .. " + SHIFT + k", window.move({ direction = "u" }))
bind(mainMod .. " + ALT + k", window.swap({ direction = "u" }))
bind(mainMod .. " + j", focus({ direction = "down" }))
bind(mainMod .. " + SHIFT + j", window.move({ direction = "d" }))
bind(mainMod .. " + ALT + j", window.swap({ direction = "d" }))

bind(mainMod .. " + comma", focus({ monitor = "l" }))
bind(mainMod .. " + period", focus({ monitor = "r" }))
bind(mainMod .. " + SHIFT + comma", window.move({ monitor = "l" }))
bind(mainMod .. " + SHIFT + period", window.move({ monitor = "r" }))

bind(mainMod .. " + q", focus({ workspace = "m-1" }))
bind(mainMod .. " + e", focus({ workspace = "m+1" }))

bind(mainMod .. " + SHIFT + e", focus({ workspace = "emptynm" }))
bind(mainMod .. " + SHIFT + N", focus({ workspace = "emptynm" }))

bind(mainMod .. " + semicolon", window.pin())

bind(mainMod .. " + tab", focus({ last = true }))
bind(mainMod .. " + SHIFT + tab", focus({ workspace = "previous" }))

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, window.move({ workspace = i }))
	hl.bind(mainMod .. " + CTRL + " .. key, window.move({ workspace = i, follow = false }))
end

bind(mainMod .. " + S", workspace.toggle_special("magic"))
bind(mainMod .. " + SHIFT + S", window.move({ workspace = "special:magic" }))
bind(mainMod .. " + U", window.move({ workspace = "m+0" }))
bind(mainMod .. " + CTRL + U", window.move({ workspace = "m+0", follow = false }))

bind(mainMod .. " + A", workspace.toggle_special("gap"))
bind(mainMod .. " + SHIFT + A", window.move({ workspace = "special:gap" }))

bind(mainMod .. " + G", group.toggle())

local resize_pix = 50

bind(mainMod .. " + i", window.resize({ x = resize_pix, y = 0, relative = true }))
bind(mainMod .. " + o", window.resize({ x = -resize_pix, y = 0, relative = true }))
bind(mainMod .. " + SHIFT + i", window.resize({ y = resize_pix, x = 0, relative = true }))
bind(mainMod .. " + SHIFT + o", window.resize({ y = -resize_pix, x = 0, relative = true }))

bind(mainMod .. " + mouse_down", focus({ workspace = "e+1" }))
bind(mainMod .. " + mouse_up", focus({ workspace = "e-1" }))

bind(mainMod .. " + mouse:272", window.drag(), { mouse = true })
bind(mainMod .. " + mouse:273", window.resize(), { mouse = true })

bind(
	"XF86AudioRaiseVolume",
	exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
bind("XF86AudioLowerVolume", exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
bind("XF86AudioMute", exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
bind("XF86AudioMicMute", exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
bind("XF86MonBrightnessUp", exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
bind("XF86MonBrightnessDown", exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

bind("XF86AudioNext", exec_cmd("playerctl next"), { locked = true })
bind("XF86AudioPause", exec_cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPlay", exec_cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPrev", exec_cmd("playerctl previous"), { locked = true })
