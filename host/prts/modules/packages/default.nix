{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    steam-run
  ];

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
      nerd-fonts.geist-mono
    ];
  };
}
