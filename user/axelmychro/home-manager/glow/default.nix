{ config, theme, ... }:
{
  xdg.configFile = {
    "glow/glow.yml".text = ''
      style: "${config.xdg.configHome}/glow/${theme}.json"
    '';
    "glow/rose-pine-dawn.json".source = ./rose-pine-dawn.json;
    "glow/rose-pine.json".source = ./rose-pine.json;
  };
}
