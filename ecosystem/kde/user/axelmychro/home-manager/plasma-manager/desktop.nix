{ assets, ... }:
let
  sans = "GeistMono Nerd Font";
  code = "GeistMono Nerd Font";
in
{
  #xdg.dataFile."color-schemes/CatppuccinFrappe.colors".source = ../assets/CatppuccinFrappe.colors;
  programs.plasma = {
    workspace = {
      #colorScheme = "CatppuccinFrappe";
      wallpaper = "${assets}/her.png";
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = null; # Plasma style. null = default
      #windowDecorations = {
      #  theme = "Breeze";
      #  library = "org.kde.breeze";
      #};
      iconTheme = "breeze-dark";
      cursor = {
        animationTime = 4;
        cursorFeedback = "Bouncing";
        size = 48;
        taskManagerFeedback = true;
        theme = "Breeze_Light";
      };
      soundTheme = "ocean";
      #splashScreen = {
      #  engine = "none";
      #  theme = "None";
      #};
    };
    kscreenlocker.appearance = {
      wallpaper = "${assets}/her.png";
      alwaysShowClock = true;
      showMediaControls = true;
    };
    kwin = {
      nightLight = {
        enable = true;
        mode = "times";
        time = {
          evening = "17:30";
          morning = "06:30";
        };
      };
      effects = {
        hideCursor = {
          hideOnInactivity = 2;
          hideOnTyping = true;
        };
        shakeCursor.enable = true;
        wobblyWindows.enable = true;
      };
    };
    fonts = {
      general = {
        family = sans;
        pointSize = 12;
      };
      fixedWidth = {
        family = code;
        pointSize = 10;
      };
      small = {
        family = sans;
        pointSize = 10;
      };
      toolbar = {
        family = sans;
        pointSize = 12;
      };
      menu = {
        family = sans;
        pointSize = 12;
      };
      windowTitle = {
        family = sans;
        pointSize = 12;
      };
    };
  };
}
