{ assets, ... }:
{
  boot = {
    loader = {
      timeout = 10;
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = false;
        configurationLimit = 10;
        consoleMode = "0";
      };
      grub = {
        enable = true;
        useOSProber = false;
        configurationLimit = 10;
        efiSupport = true;
        device = "nodev";

        gfxmodeEfi = "1920x1080";
        gfxpayloadEfi = "keep";
        gfxmodeBios = "1920x1080";
        gfxpayloadBios = "keep";

        font = "${assets}/GeistMonoNerdFont-Regular.otf";
        fontSize = 24;

        backgroundColor = "#ffffff";
        theme = "${assets}/grub/theme";
        splashImage = "${assets}/grub/splash.png";
        splashMode = "normal";
      };
    };
  };
}
