local bind = hl.bind
local exec_cmd = hl.dsp.exec_cmd
local focus = hl.dsp.focus
local window = hl.dsp.window
local workspace = hl.dsp.workspace
local group = hl.dsp.group

local mainMod = "SUPER"

bind(
	mainMod .. " + SHIFT + backslash",
	exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

local terminal = "ghostty"
bind(mainMod .. " + SHIFT + return", exec_cmd(terminal))

local closeWindowBind = bind(mainMod .. " + SHIFT + C", window.close())

closeWindowBind:set_enabled(true)

local menu = "rofi -show run -theme nord.rasi"
bind(mainMod .. " + space", exec_cmd(menu))

local switcher =
	[[hyprctl clients | awk '/title: ./ { gsub("\t*title: *", ""); print}' | rofi -dmenu -theme nord.rasi | xargs -I{} hyprctl dispatch focuswindow "title:{}"]]
bind(mainMod .. " + n", exec_cmd(switcher))

local toggle_bar = "killall waybar || waybar"
bind(mainMod .. " + b", exec_cmd(toggle_bar))

local screen_shot = "/home/defalse/.Null/Devs/myScripts/screenshot.sh"
local screen_shot_display = screen_shot .. " d"
local screen_shot_selection = screen_shot .. " s"
local screen_shot_window = screen_shot .. " w"

bind(mainMod .. " + Print", exec_cmd(screen_shot_display))
bind(mainMod .. " + SHIFT + Print", exec_cmd(screen_shot_selection))
bind(mainMod .. " + CTRL + Print", exec_cmd(screen_shot_window))

bind(mainMod .. " + P", window.pseudo())
bind(mainMod .. " + V", hl.dsp.layout("togglesplit"))
bind(mainMod .. " + SHIFT + F", window.fullscreen({ mode = "fullscreen", action = "toggle" })) -- dwindle only
bind(mainMod .. " + m", window.float({ action = "toggle" }))

local window_motions = {
	{ "h", "l" },
	{ "l", "r" },
	{ "j", "d" },
	{ "k", "u" },
}

for _, v in ipairs(window_motions) do
	local key, direction = table.unpack(v)
	bind(mainMod .. " + " .. key, focus({ direction = direction }))
	bind(mainMod .. " + SHIFT + " .. key, window.move({ direction = direction }))
	bind(mainMod .. " + CTRL + " .. key, window.move({ direction = direction, follow = false }))
	bind(mainMod .. " + ALT + " .. key, window.swap({ direction = direction }))
end

bind(mainMod .. " + semicolon", window.pin())

bind(mainMod .. " + comma", focus({ monitor = "l" }))
bind(mainMod .. " + period", focus({ monitor = "r" }))
bind(mainMod .. " + SHIFT + comma", window.move({ monitor = "l" }))
bind(mainMod .. " + SHIFT + period", window.move({ monitor = "r" }))

bind(mainMod .. " + q", focus({ workspace = "m-1" }))
bind(mainMod .. " + e", focus({ workspace = "m+1" }))

bind(mainMod .. " + SHIFT + e", focus({ workspace = "emptynm" }))
bind(mainMod .. " + SHIFT + N", focus({ workspace = "emptynm" }))

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

bind(mainMod .. " + A", workspace.toggle_special("gap"))
bind(mainMod .. " + SHIFT + A", window.move({ workspace = "special:gap" }))

bind(mainMod .. " + U", window.move({ workspace = "m+0" }))
bind(mainMod .. " + CTRL + U", window.move({ workspace = "m+0", follow = false }))

bind(mainMod .. " + G", group.toggle())

local resize_fac = 50
local resize_key = { { "i", resize_fac, 0 }, { "o", 0, resize_fac } }

for _, val in ipairs(resize_key) do
	local key, x, y = table.unpack(val)
	bind(mainMod .. " + " .. key, window.resize({ x = x, y = y, relative = true }))
	bind(mainMod .. " + SHIFT + " .. key, window.resize({ x = -x, y = -y, relative = true }))
end

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
