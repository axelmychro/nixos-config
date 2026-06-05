{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
  ];

  fonts = {
    fontconfig = {
      enable = true;
      subpixel.rgba = "rgb";
      hinting = {
        enable = true;
        style = "full";
      };
    };
    packages = with pkgs; [
      nerd-fonts.geist-mono
    ];
  };
}
