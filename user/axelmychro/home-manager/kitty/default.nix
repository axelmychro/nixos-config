{ pkgs, ... }:
let
  rose_pine_kitty_repo = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "kitty";
    rev = "main";
    hash = "sha256-GyRyflUVp1BHg6S0emZ6ViALx8L130npnfyZQmdxhfA=";
  };
in
{
  programs.kitty.enable = true;
  xdg.configFile."kitty/kitty.conf".text = ''
    hide_window_decorations yes
    font_family             GoMono Nerd Font
    font_size               16.0
    background_opacity      0.9

    ${builtins.readFile "${rose_pine_kitty_repo}/dist/rose-pine-dawn.conf"}
  '';
}
