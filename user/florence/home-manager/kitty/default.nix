let
  theme = "rose-pine";
  kitty_conf =
    if theme == "rose-pine" then
      ./kitty-rose_pine.conf
    else if theme == "rose-pine-dawn" then
      ./kitty-rose_pine_dawn.conf
    else
      "";
in
{
  programs.kitty.enable = true;
  xdg.configFile."kitty/kitty.conf".text = ''
    hide_window_decorations titlebar-only
    font_family             GoMono Nerd Font
    font_size               12.0
    background_opacity      0.95

    ${builtins.readFile kitty_conf}
  '';
}
