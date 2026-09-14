-- https://wiki.hypr.land/Configuring/Start/
require("hyprland_common")
require("hyprland_animations")
require("hyprland_devices")
require("hyprland_noctalia")
require("hyprland_windows")
require("hyprland_workspaces")

---------------------
---- MY PROGRAMS ----
---------------------
-- Set programs that you use

local function hlExec(cmd)
    return hl.dsp.exec_cmd(cmd)
end
local terminal = "kitty"
hl.bind(MAIN_MOD .. " + Return", hlExec(terminal))
local fileManager = "nautilus"
hl.bind(MAIN_MOD .. " + E", hlExec(fileManager))
--local menu = "hyprlauncher"
--hl.bind(MAIN_MOD .. " + Space", hlExec(menu))
local browser = "brave"
hl.bind(MAIN_MOD .. " + B", hlExec(browser))

-------------------
---- AUTOSTART ----
-------------------
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("HYPRCURSOR_THEME", "BreezeX-RoséPine")
hl.env("XCURSOR_SIZE", "64")
hl.env("HYPRCURSOR_SIZE", "64")

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

        border_size = 2,

        col = {
            active_border = { colors = { "rgb(eb6f92)", "rgb(c4a7e7)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
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
        inactive_opacity = 0.9,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1f1d2eee)",
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

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Example window rules that are useful
hl.window_rule({
    match = {
        class = "Mullvad Browser",
    },
    float = true,
    center = true,
})
