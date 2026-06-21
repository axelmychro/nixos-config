{ pkgs, ... }:
{
  home.packages = [
    pkgs.prettier
  ];
  programs.nixvim.plugins.conform-nvim.settings.formatters_by_ft.markdown = [ "prettier" ];
}
