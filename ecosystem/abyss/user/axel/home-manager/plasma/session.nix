_: {
  programs.plasma = {
    kwin.virtualDesktops = {
      number = 8;
      rows = 2;
      names = [
        "󰜌 "
        " "
        " "
        " "
        " "
        "󰭹 "
        "󰺵 "
        "󰏗 "
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
      position = "center";
    };
    configFile.kdeglobals = {
      General = {
        TerminalApplication = "Alacritty";
        TerminalService = "Alacritty.desktop";
      };
    };
  };
}
