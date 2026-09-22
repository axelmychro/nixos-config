{ theme, ... }:
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
  is_rose_pine_theme = theme == "rose-pine" || theme == "rose-pine-dawn";
  is_dark = theme == "rose-pine";
  is_light = theme == "rose-pine-dawn";
  mode =
    if is_dark then
      "dark"
    else if is_light then
      "light"
    else
      "auto";
  custom_palette = if is_rose_pine_theme then "rose-pine" else { };
in
{
  xdg.configFile = {
    "noctalia/palettes/rose-pine.json".text = builtins.toJSON rose_pine_palette;
    "noctalia/config.toml".text = ''
      # https://docs.noctalia.dev/noctalia/theming/

      [theme]
      mode = "${mode}"                # dark | light | auto
      source = "custom"            # builtin | wallpaper | community | custom
      builtin = "Rosé Pine"        # bundled palette name
      community_palette = ""       # community palette name when source = "community"
      custom_palette = "${custom_palette}" # file name (without .json) when source = "custom"
      wallpaper_scheme = ""        # generator used when source = "wallpaper"

      ${builtins.readFile ./config.toml}
    '';
  };
}
