local crv <const> = hl.curve
local anim <const> = hl.animation

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
crv("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
crv("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
crv("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
crv("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
crv("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
crv("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

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
