{ priestessAssets, ... }:
{
  boot.loader.grub = {
    backgroundColor = "#ff0000";
    theme = "${priestessAssets}/grub/theme";
    splashImage = "${priestessAssets}/grub/splash.png";
    splashMode = "normal";
  };
}
