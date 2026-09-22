MAIN_MOD = "SUPER" -- Sets "Windows" key as main modifier
local function hlExec(cmd)
	return hl.dsp.exec_cmd(cmd)
end
local function bindProgram(key, cmd, raw)
	local bound_key <const> = raw and key or (MAIN_MOD .. " + " .. key)
	return hl.bind(bound_key, hlExec(cmd))
end

------------------
---- MONITORS ----
------------------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1,
})
-- Fallback
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
	mirror = "eDP-1",
})

---------------
---- INPUT ----
---------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more

hl.config({
	input = {
		accel_profile = "flat",
		kb_layout = "us,ru",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

---------------------
---- MY PROGRAMS ----
---------------------

-- I use Noctalia for launcher

local terminal <const> = "kitty"
local file_manager <const> = "nautilus"
local browser <const> = "brave"
local virtual_keyboard <const> =
	"pkill wvkbd || wvkbd-mobintl -L 256 --non-exclusive --fn 'GoMono Nerd Font 16' --bg 1e1e2e --fg 313244 --text cdd6f4 --press 89b4fa"

local main_programs <const> = {
	{ key = "Return", cmd = terminal },
	{ key = "E", cmd = file_manager },
	{ key = "B", cmd = browser },
	{ key = "ALT + k", cmd = virtual_keyboard },
}
for _, program in ipairs(main_programs) do
	bindProgram(program.key, program.cmd)
end

------------------
---- NOCTALIA ----
------------------

local ipc <const> = "noctalia msg "
local noctalia_binds <const> = {
	{ key = "Space", cmd = "panel-toggle launcher" },
	{ key = "C", cmd = "panel-toggle control-center" },
	{ key = "Comma", cmd = "settings-toggle" },
	{ key = "Escape", cmd = "session lock" },

	{ key = "ALT + Tab", cmd = "window-switcher", raw = true },
	{ key = "Print", cmd = "screenshot-region", raw = true },
	{ key = "SHIFT + Print", cmd = "screenshot-fullscreen", raw = true },

	{ key = "XF86AudioRaiseVolume", cmd = "volume-up", raw = true },
	{ key = "XF86AudioLowerVolume", cmd = "volume-down", raw = true },
	{ key = "XF86AudioMute", cmd = "volume-mute", raw = true },
	{ key = "XF86AudioMicMute", cmd = "mic-mute", raw = true },
	{ key = "XF86MonBrightnessUp", cmd = "brightness-up", raw = true },
	{ key = "XF86MonBrightnessDown", cmd = "brightness-down", raw = true },
}

for _, bind in ipairs(noctalia_binds) do
	bindProgram(bind.key, ipc .. bind.cmd, bind.raw)
end

-- Noctalia Settings
hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = { 1080, 920 },
})
hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

---------------
---- KANDO ----
---------------

hl.window_rule({
	name = "kando",
	match = {
		class = "menu.kando.Kando",
		title = "Kando Menu",
	},
	no_blur = true,
	opaque = true,
	move = { 0, 0 },
	rounding = 0,
	size = { "100%", "100%" },
	border_size = 0,
	no_anim = true,
	float = true,
	pin = true,
})
hl.bind("CTRL + Space", hl.dsp.global("menu.kando.Kando:default"))

-------------------
---- AUTOSTART ----
-------------------
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
end)
hl.on("hyprland.start", function()
	hl.exec_cmd("kando")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("HYPRCURSOR_THEME", "BreezeX-RoséPine")
hl.env("XCURSOR_SIZE", "64")
hl.env("HYPRCURSOR_SIZE", "64")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Example window rules that are useful

--------------------
---- WORKSPACES ----
--------------------

for number = 1, 10 do
	local key = number % 10 -- 10 maps to key 0

	-- Switch workspaces with MAIN_MOD + [0-9]
	hl.bind(MAIN_MOD .. " + " .. key, hl.dsp.focus({ workspace = number }))

	-- Move active window to a workspace with MAIN_MOD + SHIFT + [0-9]
	hl.bind(MAIN_MOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = number }))
end
hl.bind(MAIN_MOD .. " + N", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MAIN_MOD .. " + P", hl.dsp.focus({ workspace = "e-1" }))
-- Scroll through existing workspaces with MAIN_MOD + scroll
hl.bind(MAIN_MOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MAIN_MOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

local workspace_names <const> = { "main", "docs", "code", "chat", "media" }
for number, name in ipairs(workspace_names) do
	hl.workspace_rule({
		workspace = tostring(number),
		monitor = "eDP-1",
		persistent = true,
		default_name = name,
	})
end

-- Example special workspace (scratchpad)
hl.bind(MAIN_MOD .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MAIN_MOD .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Layouts
hl.config({ dwindle = { preserve_split = true } }) -- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout
hl.config({ master = { new_status = "master" } }) -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({ scrolling = { fullscreen_on_one_column = true } }) -- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({ general = { layout = "dwindle" } })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
local smart_gaps = false
local function applySmartGaps()
	hl.workspace_rule({
		workspace = "w[tv1]",
		gaps_out = smart_gaps and 0 or 10,
		gaps_in = smart_gaps and 0 or 10,
	})

	hl.workspace_rule({
		workspace = "f[1]",
		gaps_out = smart_gaps and 0 or 10,
		gaps_in = smart_gaps and 0 or 10,
	})

	hl.window_rule({
		name = "no-gaps-wtv1",
		match = {
			float = false,
			workspace = "w[tv1]",
		},
		border_size = smart_gaps and 0 or 2,
		rounding = smart_gaps and 0 or 10,
	})

	hl.window_rule({
		name = "no-gaps-f1",
		match = {
			float = false,
			workspace = "f[1]",
		},
		border_size = smart_gaps and 0 or 2,
		rounding = smart_gaps and 0 or 10,
	})
end
applySmartGaps()
hl.bind(MAIN_MOD .. " + ALT + S", function()
	smart_gaps = not smart_gaps
	applySmartGaps()

	local state = smart_gaps and "enabled" or "disabled"
	hl.exec_cmd(ipc .. "notification-show 'Smart gaps " .. state .. "' Hyprland")
end)

-----------------
---- WINDOWS ----
-----------------

local close_window_bind <const> = hl.bind(MAIN_MOD .. " + Q", hl.dsp.window.close())
close_window_bind:set_enabled(true)

local shutdown <const> = {
	key = "CTRL + Z",
	cmd = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'",
}
bindProgram(shutdown.key, shutdown.cmd)

local window_controls <const> = {
	{ key = "H", direction = "left", dx = -10, dy = 0 },
	{ key = "J", direction = "down", dx = 0, dy = -10 },
	{ key = "K", direction = "up", dx = 0, dy = 10 },
	{ key = "L", direction = "right", dx = 10, dy = 0 },
}
for _, control in ipairs(window_controls) do
	-- Focus
	hl.bind(MAIN_MOD .. " + " .. control.key, hl.dsp.focus({ direction = control.direction }))

	-- Move window
	hl.bind(MAIN_MOD .. " + SHIFT + " .. control.key, hl.dsp.window.move({ direction = control.direction }))

	-- Resize window
	hl.bind(
		MAIN_MOD .. " + ALT + " .. control.key,
		hl.dsp.window.resize({ x = control.dx, y = control.dy, relative = true }),
		{ repeating = true }
	)
end
hl.bind(MAIN_MOD .. " + Tab", hl.dsp.window.cycle_next()) -- Technically part of focus controlling
hl.bind(MAIN_MOD .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MAIN_MOD .. " + M", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(MAIN_MOD .. " + V", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move/resize windows with MAIN_MOD + LMB/RMB and dragging
hl.bind(MAIN_MOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MAIN_MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Rules
local suppress_maximise_rule <const> = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppress_maximise_rule:set_enabled(true)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
local overlay_layer_rule = hl.layer_rule({
	name = "no-anim-overlay",
	match = { namespace = "^my-overlay$" },
	no_anim = true,
})
overlay_layer_rule:set_enabled(true)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- Letterboxing
hl.window_rule({
	match = {
		class = "Mullvad Browser",
	},
	float = true,
	center = true,
})

-----------------------
---- LOOK AND FEEL ----
-----------------------
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	misc = {
		force_default_wallpaper = 1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})
hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 12,

		border_size = 3,

		col = {
			active_border = {
				colors = {
					string.format("rgb(%s)", theme.secondary),
					string.format("rgb(%s)", theme.primary),
					string.format("rgb(%s)", theme.tertiary),
				},
				angle = 45,
			},
			inactive_border = string.format("rgba(%saa)", theme.muted),
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = true,
	},

	decoration = {
		rounding = 2,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.95,

		shadow = {
			enabled = true,
			range = 6,
			render_power = 3,
			color = string.format("rgba(%see)", theme.base),
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

--------------------
---- ANIMATIONS ----
--------------------

local crv <const> = hl.curve
-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
crv("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
crv("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
crv("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
crv("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
crv("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
crv("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

local anim <const> = hl.animation
anim({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
anim({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
anim({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
anim({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
anim({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
anim({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
anim({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
anim({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
anim({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
anim({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
anim({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
anim({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
anim({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
anim({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
anim({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
anim({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
anim({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
