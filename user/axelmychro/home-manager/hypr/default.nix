{ system_hyprland, theme, ... }:
let
  #base = "191724";
  primary = "c4a7e7";
  secondary = "eb6f92";
  tertiary = "9ccfd8";
  muted = "6e6a86";

  #base_dawn = "faf4ed";
  primary_dawn = "907aa9";
  secondary_dawn = "b4637a";
  tertiary_dawn = "56949f";
  muted_dawn = "9893a5";

  is_dawn = theme == "rose-pine-dawn";

  current_theme = {
    base = muted_dawn;
    primary = if is_dawn then primary_dawn else primary;
    secondary = if is_dawn then secondary_dawn else secondary;
    tertiary = if is_dawn then tertiary_dawn else tertiary;
    muted = if is_dawn then muted_dawn else muted;
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
          primary = "${current_theme.primary}",
          secondary = "${current_theme.secondary}",
          tertiary = "${current_theme.tertiary}",
          muted = "${current_theme.muted}",
          shadow = "#191724",
      }
      ${builtins.readFile ./hyprland.lua}
    '';
  };
}
