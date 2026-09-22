{ system_hyprland, theme, ... }:
let
  base = "191724";
  muted = "6e6a86";
  primary = "c4a7e7";
  secondary = "eb6f92";
  tertiary = "9ccfd8";

  base_dawn = "faf4ed";
  muted_dawn = "9893a5";
  primary_dawn = "907aa9";
  secondary_dawn = "b4637a";
  tertiary_dawn = "56949f";

  is_dawn = theme == "rose-pine-dawn";

  current_theme = {
    base = if is_dawn then base_dawn else base;
    muted = if is_dawn then muted_dawn else muted;
    primary = if is_dawn then primary_dawn else primary;
    secondary = if is_dawn then secondary_dawn else secondary;
    tertiary = if is_dawn then tertiary_dawn else tertiary;
  };
in
{
  services.hyprpolkitagent.enable = system_hyprland.is_enabled;
  wayland.windowManager.hyprland = {
    enable = system_hyprland.is_enabled;
    # WARNING: If you use the Home Manager module, make sure to disable the systemd integration as it conflicts with UWSM.
    systemd.enable = !system_hyprland.uwsm.is_enabled;
    configType = "lua";
    extraConfig = ''
      local theme <const> = {
      	base = "${current_theme.base}",
      	muted = "${current_theme.muted}",
      	primary = "${current_theme.primary}",
      	secondary = "${current_theme.secondary}",
      	tertiary = "${current_theme.tertiary}",
      }
      ${builtins.readFile ./hyprland.lua}
    '';
  };
}
