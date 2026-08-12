{ lib, assets, ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    systemd-boot = {
      enable = lib.mkForce false;
      configurationLimit = 8;
      consoleMode = "0";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = 4;
      useOSProber = false;

      gfxmodeEfi = "1920x1080";
      gfxpayloadEfi = "keep";
      gfxmodeBios = "1920x1080";
      gfxpayloadBios = "keep";

      font = "${assets}/GoMonoNerdFont-Regular.ttf";
      fontSize = 16;

      backgroundColor = "#ffffff";
      theme = "${assets}/grub/theme";
      splashImage = "${assets}/grub/splash.png";
      splashMode = "normal";
    };
  };
}
