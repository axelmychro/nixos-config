-----------------
---- WINDOWS ----
-----------------

local closeWindowBind = hl.bind(MAIN_MOD .. " + Q", hl.dsp.window.close())
closeWindowBind:set_enabled(true)
hl.bind(
	MAIN_MOD .. " + CTRL + SHIFT + ALT + Z",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

local controls = {
	{ key = "H", direction = "left", dx = -10, dy = 0 },
	{ key = "J", direction = "down", dx = 0, dy = -10 },
	{ key = "K", direction = "up", dx = 0, dy = 10 },
	{ key = "L", direction = "right", dx = 10, dy = 0 },
}
for _, control in ipairs(controls) do
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
hl.bind(MAIN_MOD .. " + P", hl.dsp.window.pseudo())
hl.bind(MAIN_MOD .. " + V", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move/resize windows with MAIN_MOD + LMB/RMB and dragging
hl.bind(MAIN_MOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MAIN_MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Rules
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

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
local overlayLayerRule = hl.layer_rule({
	name = "no-anim-overlay",
	match = { namespace = "^my-overlay$" },
	no_anim = true,
})
overlayLayerRule:set_enabled(true)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
