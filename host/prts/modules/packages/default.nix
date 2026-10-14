{ pkgs, ... }:
{
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      nerd-fonts.go-mono
      corefonts
    ];
  };
}
