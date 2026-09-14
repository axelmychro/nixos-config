{ hyprland_enabled, ... }:
{
  services.hyprpolkitagent.enable = hyprland_enabled;
  wayland.windowManager.hyprland = {
    enable = hyprland_enabled;
    configType = "lua";
    extraConfig = builtins.readFile ./hyprland.lua;
  };
  xdg.configFile =
    if hyprland_enabled then
      {
        "hypr/hyprland_animations.lua".source = ./hyprland_animations.lua;
        "hypr/hyprland_common.lua".source = ./hyprland_common.lua;
        "hypr/hyprland_devices.lua".source = ./hyprland_devices.lua;
        "hypr/hyprland_noctalia.lua".source = ./hyprland_noctalia.lua;
        "hypr/hyprland_windows.lua".source = ./hyprland_windows.lua;
        "hypr/hyprland_workspaces.lua".source = ./hyprland_workspaces.lua;
        "hypr/.luarc.json".source = ./luarc.json;
      }
    else
      { };
}
