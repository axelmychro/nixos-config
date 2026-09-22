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

    panels = [
      {
        anchor = cosmicLib.cosmic.mkRON "enum" "Top";
        anchor_gap = true;
        autohide = cosmicLib.cosmic.mkRON "optional" {
          wait_time = 500;
          transition_time = 200;
          handle_size = 2;
          unhide_delay = 200;
        };
        background = cosmicLib.cosmic.mkRON "enum" "ThemeDefault";
        expand_to_edges = true;
        margin = 0;
        name = "Panel";
        opacity = 1.0;
        output = cosmicLib.cosmic.mkRON "enum" "All";
        plugins_center = cosmicLib.cosmic.mkRON "optional" [
          "com.system76.CosmicAppletTime"
        ];
        plugins_wings = cosmicLib.cosmic.mkRON "optional" (
          cosmicLib.cosmic.mkRON "tuple" [
            [
              "com.system76.CosmicPanelWorkspacesButton"
              "com.system76.CosmicPanelAppButton"
              "com.system76.CosmicAppletWorkspaces"
            ]
            [
              "com.system76.CosmicAppletInputSources"
              "com.system76.CosmicAppletA11y"
              "com.system76.CosmicAppletStatusArea"
              "com.system76.CosmicAppletTiling"
              "com.system76.CosmicAppletAudio"
              "com.system76.CosmicAppletBluetooth"
              "com.system76.CosmicAppletNetwork"
              "com.system76.CosmicAppletBattery"
              "com.system76.CosmicAppletNotifications"
              "com.system76.CosmicAppletPower"
            ]
          ]
        );
        size = cosmicLib.cosmic.mkRON "enum" "XS";
        size_center = cosmicLib.cosmic.mkRON "optional" null;
        size_wings = cosmicLib.cosmic.mkRON "optional" null;

      }
      {
        anchor = cosmicLib.cosmic.mkRON "enum" "Bottom";
        anchor_gap = false;
        autohide = cosmicLib.cosmic.mkRON "optional" {
          wait_time = 500;
          transition_time = 200;
          handle_size = 2;
          unhide_delay = 200;
        };
        background = cosmicLib.cosmic.mkRON "enum" "ThemeDefault";
        border_radius = 12;
        exclusive_zone = false;
        expand_to_edges = false;
        keyboard_interactivity = cosmicLib.cosmic.mkRON "enum" "OnDemand";
        layer = cosmicLib.cosmic.mkRON "enum" "Top";
        margin = 0;
        name = "Dock";
        opacity = 1.0;
        output = cosmicLib.cosmic.mkRON "enum" "All";
        padding = 4;
        padding_overlap = 0.5;
        spacing = 0;
        plugins_center = cosmicLib.cosmic.mkRON "optional" [
          "com.system76.CosmicPanelLauncherButton"
          "com.system76.CosmicPanelWorkspacesButton"
          "com.system76.CosmicPanelAppButton"
          "com.system76.CosmicAppList"
          "com.system76.CosmicAppletMinimize"
        ];
        plugins_wings = cosmicLib.cosmic.mkRON "optional" null;
        size = cosmicLib.cosmic.mkRON "enum" "L";
        size_center = cosmicLib.cosmic.mkRON "optional" null;
        size_wings = cosmicLib.cosmic.mkRON "optional" null;
        autohover_delay_ms = cosmicLib.cosmic.mkRON "optional" 500;
      }
    ];
  };
}
