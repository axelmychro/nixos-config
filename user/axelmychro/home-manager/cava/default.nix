{ pkgs, ... }:
let
  rose_pine_cava_repo = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "cava";
    rev = "main";
    hash = "sha256-i0Z5ZFygo+AjCo9NlwBhA41srwsDgAc7GPXPHCWngPc=";
  };
in
{
  programs.cava.enable = true;
  xdg.configFile."cava/config".text = ''
    [color]
    ${builtins.readFile "${rose_pine_cava_repo}/dawn"}
  '';
}
