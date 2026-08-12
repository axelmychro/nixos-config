{ pkgs, ... }:
let
  rose_pine_yazi_repo = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "yazi";
    rev = "main";
    hash = "sha256-9e3dXViWl1rK9BPrGAFfs9ZL/tsG6Njz6ksuU6AIrFY=";
  };
in
{
  programs.yazi = {
    flavors = {
      rose-pine = pkgs.runCommand "rose-pine.yazi" { } ''
        cp -r ${rose_pine_yazi_repo}/flavors/rose-pine.yazi $out
      '';
      rose-pine-dawn = pkgs.runCommand "rose-pine-dawn.yazi" { } ''
        cp -r ${rose_pine_yazi_repo}/flavors/rose-pine-dawn.yazi $out
      '';
    };
    enable = true;
  };

  xdg.configFile."yazi/theme.toml".text = ''
    [flavor]
    light = "rose-pine-dawn"
    dark = "rose-pine"

    ${builtins.readFile "${rose_pine_yazi_repo}/themes/rose-pine-dawn.toml"}
  '';
}
