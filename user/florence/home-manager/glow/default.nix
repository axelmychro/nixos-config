{ config, user, ... }:
let
  theme = "rose-pine";
in
{
  xdg.configFile = {
    "glow/glow.yml".text = ''
      # style name or JSON path (default "auto")
      style: "${user.home_dir}/.config/glow/rose-pine.json"
      # mouse support (TUI-mode only)
      mouse: false
      # use pager to display markdown
      pager: false
      # word-wrap at width
      width: 80
      # show all files, including hidden and ignored.
      all: false
      # style
      style: "${config.xdg.configHome}/glow/${theme}.json"
    '';
    "glow/rose-pine-dawn.json".source = ./rose-pine-dawn.json;
    "glow/rose-pine.json".source = ./rose-pine.json;
  };
}
