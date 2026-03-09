_: {
  programs.noctalia-shell.settings.bar.widgets = {
    left = [
      {
        id = "ControlCenter";
        useDistroLogo = false;
        enableColorization = true;
      }
      {
        id = "Network";
      }
      {
        id = "Bluetooth";
      }
    ];
    center = [
      {
        hideUnoccupied = false;
        id = "Workspace";
        labelMode = "none";
      }
    ];
    right = [
      {
        id = "MediaMini";
      }
      {
        id = "Brightness";
      }
      {
        id = "Volume";
      }
      {
        alwaysShowPercentage = false;
        id = "Battery";
        warningThreshold = 30;
      }
      {
        formatHorizontal = "HH:mm";
        formatVertical = "HH mm";
        id = "Clock";
        useMonospacedFont = true;
        usePrimaryColor = true;
      }
      {
        id = "NotificationHistory";
      }
      {
        id = "Tray";
      }
    ];
  };
}
