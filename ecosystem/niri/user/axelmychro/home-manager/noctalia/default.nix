{ noctalia, ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile."noctalia/config.toml".source = ./config.toml;
  imports = [
    noctalia.homeModules.default
  ];
}
