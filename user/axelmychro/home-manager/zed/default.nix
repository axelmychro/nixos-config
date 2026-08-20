_:
let
  font = "GoMono Nerd Font";
in
{
  programs.zed-editor = {
    extensions = [
      "editorconfig"
      "git-firefly"
      "rose-pine-theme"
    ];
    userSettings = {
      # Core
      disable_ai = true;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      vim_mode = true;
      format_on_save = "on";

      redact_private_values = true;
      use_system_prompts = false;
      use_system_path_prompts = false;

      # Interface
      toolbar.breadcrumbs = true;
      ui_font_family = font;
      buffer_font_family = font;
      terminal.font_family = font;
      show_whitespaces = "all";

      ## Colorscheme
      theme = {
        mode = "system";
        light = "Rosé Pine Dawn";
        dark = "Rosé Pine";
      };
      #icon_theme = {
      #  mode = "system";
      #  light = "";
      #  dark = "";
      #};
    };
    enable = true;
  };
  imports = [
    ./lang
  ];
}
