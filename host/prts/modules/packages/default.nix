{ pkgs, ... }:
{
  fonts = {
    fontconfig = {
      subpixel.rgba = "rgb";
      hinting = {
        enable = true;
        style = "full";
      };
      enable = true;
    };
    packages = with pkgs; [
      nerd-fonts.go-mono
    ];
  };
}
