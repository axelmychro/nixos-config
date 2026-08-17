_: {
  programs.yazi = {
    flavors = {
      rose-pine = ./flavors/rose-pine.yazi;
      rose-pine-dawn = ./flavors/rose-pine-dawn.yazi;
    };
    enable = true;
  };
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;
}
