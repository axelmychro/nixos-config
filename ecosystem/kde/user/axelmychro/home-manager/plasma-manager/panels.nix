_: {
  programs.plasma.panels = [
    {
      location = "top";
      alignment = "center";
      floating = false;
      height = 24;
      hiding = "none";
      lengthMode = "fill";
      opacity = "opaque";

      widgets = [
        #"org.kde.plasma.showdesktop"
        {
          pager.general = {
            showWindowOutlines = false;
            showApplicationIconsOnWindowOutlines = false;
            showOnlyCurrentScreen = false;
            navigationWrapsAround = false;
            displayedText = "desktopName";
          };
        }
        {
          iconTasks = {
            launchers = [ ];
          };
        }
        "org.kde.plasma.panelspacer"
        {
          digitalClock = {
            date.format.custom = "ddd, d MMM";
            calendar.firstDayOfWeek = "monday";
          };
        }
        "org.kde.plasma.panelspacer"
        {
          systemTray.items = {
            shown = [
              "org.kde.plasma.volume"
              "org.kde.plasma.brightness"
              "org.kde.plasma.battery"
              "org.kde.plasma.networkmanagement"
            ];

            hidden = [
              "org.kde.plasma.mediacontrol"
              "org.kde.plasma.clipboard"
              "org.kde.plasma.bluetooth"
            ];
          };
        }

        {
          kickoff.icon = "nix-snowflake";
        }
      ];
    }
  ];
}
