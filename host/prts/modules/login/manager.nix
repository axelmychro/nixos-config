{
  lib,
  assets,
  ...
}:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = lib.mkForce true;
  };

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
    backgrounds = {
      "pries.mp4" = "${assets}/pries.mp4";
    };

    settings = {
      "LoginScreen" = {
        background = "pries.mp4";
      };
      "LockScreen" = {
        background = "pries.mp4";
      };
      "LockScreen.Message" = {
        text = "Welcome back, Oracle.";
      };
    };
  };
}
