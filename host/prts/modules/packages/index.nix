{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    steam-run
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

  imports = [
    #./flatpak.nix
  ];
}
