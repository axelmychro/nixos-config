------------------
---- NOCTALIA ----
------------------
local ipc = "noctalia msg "

-- Core binds
hl.bind(MAIN_MOD .. " + Space", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(MAIN_MOD .. " + C", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(MAIN_MOD .. " + comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher"))
hl.bind("Print", hl.dsp.exec_cmd(ipc .. "screenshot-region"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(ipc .. "screenshot-fullscreen"))
hl.bind(MAIN_MOD .. " + Escape", hl.dsp.exec_cmd(ipc .. "session lock"))

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. "mic-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))

-- Noctalia Settings
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})
