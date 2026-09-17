{
  config,
  lib,
  theme,
  ...
}:
let
  font_name = "GoMono Nerd Font";
  rose_pine_theme = theme == "rose-pine" || theme == "rose-pine-dawn";
in
{
  imports = [
    ./lang
  ];

  programs.zed-editor = lib.mkMerge [
    {
      enable = true;

      extensions = [
        "editorconfig"
        "git-firefly"
      ];

      userSettings = {
        vim_mode = true;
        disable_ai = true;
        telemetry = {
          diagnostics = false;
          metrics = false;
        };

        format_on_save = "on";
        redact_private_values = true;
        show_whitespaces = "all";
        toolbar.breadcrumbs = true;
        use_system_path_prompts = false;
        use_system_prompts = false;
      };
    }

    (lib.mkIf (!config.stylix.targets.zed.enable) {
      extensions = lib.optionals rose_pine_theme [
        "rose-pine-theme"
      ];

      userSettings = {
        buffer_font_family = font_name;
        terminal.font_family = font_name;
        ui_font_family = font_name;

        theme = lib.mkIf rose_pine_theme {
          dark = "Rosé Pine";
          light = "Rosé Pine Dawn";
        };
      };
    })
  ];
}
