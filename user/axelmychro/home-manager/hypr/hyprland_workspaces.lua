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
-- Scroll through existing workspaces with MAIN_MOD + scroll
hl.bind(MAIN_MOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MAIN_MOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

local workspace_names = { "terminal", "media", "chat", "game", "design" }
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
if smart_gaps then
    hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
    hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
    hl.window_rule({
        name = "no-gaps-wtv1",
        match = { float = false, workspace = "w[tv1]" },
        border_size = 0,
        rounding = 0,
    })
    hl.window_rule({
        name = "no-gaps-f1",
        match = { float = false, workspace = "f[1]" },
        border_size = 0,
        rounding = 0,
    })
end
