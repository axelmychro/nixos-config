{ skadiAssets, ... }:
{
  boot.loader.grub = {
    backgroundColor = "#ff0000";
    theme = "${skadiAssets}/grub/theme";
    splashImage = "${skadiAssets}/grub/splash.png";
    splashMode = "normal";
  };
}
