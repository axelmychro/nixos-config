{ wallpaper-file, ... }: {
  xdg.configFile = {
    "cosmic/com.system76.CosmicSettings.Wallpaper/v1/custom-images" = {
      text = ''
        [
            "${wallpaper-file}",
        ]
      '';
      force = true;
    };
    "cosmic/com.system76.CosmicBackground/v1/all" = {

      text = ''
        (
            output: "all",
            source: Path("${wallpaper-file}"),
            filter_by_theme: true,
            rotation_frequency: 300,
            filter_method: Lanczos,
            scaling_mode: Zoom,
            sampling_method: Alphanumeric,
        )
      '';
      force = true;
    };
    "cosmic/com.system76.CosmicBackground/v1/output.eDP-1" = {

      text = ''
        (
            output: "eDP-1",
            source: Path("${wallpaper-file}"),
            filter_by_theme: true,
            filter_by_theme: true,
            rotation_frequency: 300,
            filter_method: Lanczos,
            scaling_mode: Zoom,
            sampling_method: Alphanumeric,
            rotation_frequency: 300,
            filter_method: Lanczos,
            scaling_mode: Zoom,
            sampling_method: Alphanumeric,
        )
      '';
      force = true;
    };
  };
}
