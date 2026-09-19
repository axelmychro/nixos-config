let
  # Rosé Pine Dawn
  dawn_base = "#faf4ed";
  dawn_surface = "#fffaf3";
  dawn_overlay = "#f2e9e1";
  dawn_muted = "#9893a5";
  #dawn_subtle = "#797593";
  dawn_text = "#464261";
  dawn_love = "#b4637a";
  dawn_gold = "#ea9d34";
  dawn_rose = "#d7827e";
  dawn_pine = "#286983";
  dawn_foam = "#56949f";
  dawn_iris = "#907aa9";
  #dawn_highlight_low = "#f4ede8";
  dawn_highlight_med = "#dfdad9";
  #dawn_highlight_high = "#cecacd";

  # Rosé Pine
  base = "#191724";
  surface = "#1f1d2e";
  overlay = "#26233a";
  muted = "#6e6a86";
  #subtle = "#908caa";
  text = "#e0def4";
  love = "#eb6f92";
  gold = "#f6c177";
  rose = "#ebbcba";
  pine = "#31748f";
  foam = "#9ccfd8";
  iris = "#c4a7e7";
  #highlight_low = "#21202e";
  highlight_med = "#403d52";
  #highlight_high = "#524f67";

  # Palette
  rose_pine_palette = {
    dark = {
      mPrimary = iris;
      mOnPrimary = base;
      mSecondary = foam;
      mOnSecondary = base;
      mTertiary = pine;
      mOnTertiary = text;
      mError = love;
      mOnError = base;
      mSurface = base;
      mOnSurface = text;
      mSurfaceVariant = surface;
      mOnSurfaceVariant = iris;
      mOutline = muted;
      mShadow = base;
      mHover = overlay;
      mOnHover = text;
      terminal = {
        background = base;
        foreground = text;
        cursor = text;
        cursorText = base;
        selectionBg = highlight_med;
        selectionFg = text;
        normal = {
          black = overlay;
          red = love;
          green = pine;
          yellow = gold;
          blue = foam;
          magenta = iris;
          cyan = rose;
          white = text;
        };
        bright = {
          black = muted;
          red = love;
          green = pine;
          yellow = gold;
          blue = foam;
          magenta = iris;
          cyan = rose;
          white = text;
        };
      };
    };
    light = {
      mPrimary = dawn_iris;
      mOnPrimary = dawn_base;
      mSecondary = dawn_foam;
      mOnSecondary = dawn_base;
      mTertiary = dawn_pine;
      mOnTertiary = dawn_base;
      mError = dawn_love;
      mOnError = dawn_base;
      mSurface = dawn_base;
      mOnSurface = dawn_text;
      mSurfaceVariant = dawn_surface;
      mOnSurfaceVariant = dawn_text;
      mOutline = dawn_iris;
      mShadow = dawn_highlight_med;
      mHover = dawn_overlay;
      mOnHover = dawn_text;
      terminal = {
        background = dawn_base;
        foreground = dawn_text;
        cursor = dawn_text;
        cursorText = dawn_base;
        selectionBg = dawn_highlight_med;
        selectionFg = dawn_text;
        normal = {
          black = dawn_overlay;
          red = dawn_love;
          green = dawn_pine;
          yellow = dawn_gold;
          blue = dawn_foam;
          magenta = dawn_iris;
          cyan = dawn_rose;
          white = dawn_text;
        };
        bright = {
          black = dawn_muted;
          red = dawn_love;
          green = dawn_pine;
          yellow = dawn_gold;
          blue = dawn_foam;
          magenta = dawn_iris;
          cyan = dawn_rose;
          white = dawn_text;
        };
      };
    };
  };
in
{
  xdg.configFile = {
    "noctalia/palettes/rose-pine.json".text = builtins.toJSON rose_pine_palette;
    "noctalia/config.toml".text = ''
      # https://docs.noctalia.dev/noctalia/configuration/shell/

      [shell]
      offline_mode = true
      telemetry_enabled = false

      font_family = "GoMono Nerd Font"
      time_format = "{:%-I:%M %p}"
      setup_wizard_enabled = false
      avatar_path = "~/.face"

      [shell.launcher]
      app_grid = true
      sort_by_usage = false

      [shell.screenshot]
      save_to_file = true
      directory = "~/Pictures/Screenshots"
      confirm_region = true
      show_cursor = true
      annotate = true

      # https://docs.noctalia.dev/noctalia/bar/

      [bar]
      order = ["default"]

      [bar.default]
      enabled = true
      auto_hide = true
      smart_auto_hide = true
      reserve_space = false
      position = "bottom"
      radius_bottom_left = 0
      radius_bottom_right = 0
      show_on_workspace_switch = false
      layer = "overlay"

      thickness = 64
      background_opacity = 1.0
      border_width = 2
      contact_shadow = true
      concave_edge_corners = false
      margin_ends = 512
      margin_edge = -2
      padding = 12
      widget_spacing = 8

      capsule = true
      capsule_thickness = 0.5
      capsule_radius = 2.0
      capsule_opacity = 1.0

      start = ["session", "clock", "network", "bluetooth"]
      center = ["workspaces"]
      end = ["tray", "volume", "brightness", "battery", "clipboard", "notifications"]

      # https://docs.noctalia.dev/noctalia/desktop/wallpaper/

      [wallpaper]
      enabled = true
      fill_color = "#191724"
      directory = "~/Pictures/Wallpapers"

      [wallpaper.default]
      path = "~/Pictures/Wallpapers/seaside-bus-stop-view.png"

      #https://docs.noctalia.dev/noctalia/theming/

      [theme]
      mode = "dark"                # dark | light | auto
      source = "custom"            # builtin | wallpaper | community | custom
      builtin = "Rosé Pine"        # bundled palette name
      community_palette = ""       # community palette name when source = "community"
      custom_palette = "rose-pine" # file name (without .json) when source = "custom"
      wallpaper_scheme = ""        # generator used when source = "wallpaper"

      # https://docs.noctalia.dev/noctalia/services/battery/

      [battery]
      warning_threshold = 50

      [brightness]
      minimum_brightness = 0.1

      [idle]
      behavior_order = ["lock", "screen-off", "suspend"]
      pre_action_fade_seconds = 2.0
      [idle.behavior.lock]
      enabled = true
      timeout = 600
      action = "lock"
      [idle.behavior.screen-off]
      enabled = false
      [idle.behavior.suspend]
      enabled = true
      timeout = 900
      action = "lock_and_suspend"

      [system.monitor]
      enabled = false

      [weather]
      enabled = false
    '';
  };
}
