_: {
  programs.plasma = {
    kwin.virtualDesktops = {
      number = 3;
      rows = 1;
      names = [
        "󰜌 "
        " "
        " "
        #" "
        #" "
        #"󰭹 "
        #"󰺵 "
        #"󰏗 "
      ];
    };
    session = {
      general.askForConfirmationOnLogout = false;
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };
    kscreenlocker = {
      lockOnResume = true; # resume = after sleep
      timeout = 5; # minutes before screen is locked
    };
    krunner = {
      shortcuts.launch = [ "Meta+Space" ];
      activateWhenTypingOnDesktop = false;
      historyBehavior = "disabled";
      position = "top";
    };
    configFile.kdeglobals = {
      General = {
        TerminalApplication = "konsole";
        TerminalService = "org.kde.konsole.desktop";
      };
    };
  };
}
