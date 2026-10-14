{
  cosmicLib,
  inputs,
  theme,
  wallpaper-file,
  ...
}:
let
  is_dark = theme == "rose-pine";
  is_light = theme == "rose-pine-dawn";
  mode =
    if is_dark then
      "dark"
    else if is_light then
      "light"
    else
      "auto";
in
{
  imports = [ inputs.cosmic-manager.homeManagerModules.cosmic-manager ];
  xdg.configFile = {
    "cosmic/com.system76.CosmicTheme.Dark/v1" = {
      source = ./theme-dark;
      recursive = true;
    };
    "cosmic/com.system76.CosmicTheme.Light/v1" = {
      source = ./theme-light;
      recursive = true;
    };
  };
  wayland.desktopManager.cosmic = {
    enable = true;
    appearance = {
      theme = {
        inherit mode;
      };
      toolkit = {
        interface_font = {
          family = "GoMono Nerd Font";
          stretch = cosmicLib.cosmic.mkRON "enum" "Normal";
          style = cosmicLib.cosmic.mkRON "enum" "Normal";
          weight = cosmicLib.cosmic.mkRON "enum" "Normal";
        };
        monospace_font = {
          family = "GoMono Nerd Font";
          stretch = cosmicLib.cosmic.mkRON "enum" "Normal";
          style = cosmicLib.cosmic.mkRON "enum" "Normal";
          weight = cosmicLib.cosmic.mkRON "enum" "Normal";
        };
      };
    };
    applets.app-list.settings = {
      favorites = [
        "brave-browser"
        "com.system76.CosmicFiles"
        "dev.zed.Zed"
        "kitty"
        "com.system76.CosmicSettings"
      ];
    };
    wallpapers = [
      {
        output = "all";
        filter_by_theme = false;
        filter_method = cosmicLib.cosmic.mkRON "enum" "Lanczos";
        rotation_frequency = 600;
        sampling_method = cosmicLib.cosmic.mkRON "enum" "Alphanumeric";
        scaling_mode = cosmicLib.cosmic.mkRON "enum" "Zoom";
        source = cosmicLib.cosmic.mkRON "enum" {
          value = [ wallpaper-file ];
          variant = "Path";
        };
      }
    ];
  };
}
