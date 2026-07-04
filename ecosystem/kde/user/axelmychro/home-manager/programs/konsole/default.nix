{ pkgs, ... }:
{
  home.packages = [
    pkgs.kdePackages.konsole
  ];
  xdg.dataFile."konsole/catppuccin-macchiato.colorscheme".source = ./catppuccin-macchiato.colorscheme;
}
