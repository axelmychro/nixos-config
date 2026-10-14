{ lib, assets, ... }:
let
  config_max = 2;
in
{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    systemd-boot = {
      enable = lib.mkForce false;
      configurationLimit = config_max;
      consoleMode = "0";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = config_max;
      useOSProber = false;

      gfxmodeEfi = "1920x1080";
      gfxpayloadEfi = "keep";
      gfxmodeBios = "1920x1080";
      gfxpayloadBios = "keep";

      font = "${assets}/GoMonoNerdFont-Regular.ttf";
      fontSize = 24;

      backgroundColor = "#ffffff";
      theme = "${assets}/grub/theme";
      splashImage = "${assets}/grub/splash.png";
      splashMode = "normal";
    };
  };
}
