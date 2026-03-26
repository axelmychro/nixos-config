{ systemAssets, ... }:
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
        configurationLimit = 10;
        efiSupport = true;
        useOSProber = false;
        device = "nodev";
        gfxmodeEfi = "1920x1080";
        gfxpayloadEfi = "keep";
        gfxmodeBios = "1920x1080";
        gfxpayloadBios = "keep";

        font = "${systemAssets}/GeistMonoNerdFont-Regular.ttf";
        fontSize = 16;

        # backgroundColor = "#ff0000";
        # splashMode = "normal";
      };
    };
  };
}
