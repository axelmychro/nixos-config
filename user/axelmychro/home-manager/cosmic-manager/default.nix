{
  cosmicLib,
  inputs,
  wallpaper-file,
  ...
}:
{

  imports = [ inputs.cosmic-manager.homeManagerModules.cosmic-manager ];
  wayland.desktopManager.cosmic = {
    enable = true;
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
        scaling_mode = cosmicLib.cosmic.mkRON "enum" {
          value = [
            (cosmicLib.cosmic.mkRON "tuple" [
              0.5
              1.0
              (cosmicLib.cosmic.mkRON "raw" "0.345354352")
            ])
          ];
          variant = "Fit";
        };
        source = cosmicLib.cosmic.mkRON "enum" {
          value = [ wallpaper-file ];
          variant = "Path";
        };
      }
    ];
  };
}
