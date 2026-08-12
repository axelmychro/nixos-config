_: {
  programs.fastfetch.enable = true;
  xdg.configFile = {
    "fastfetch/config.jsonc".source = ./config.jsonc;
    "fastfetch/nix.txt".source = ./src/nix.txt;

    "fastfetch/zconf.json".source = ./zconf.json;
    "fastfetch/closure.png".source = ./src/closure.png;
  };
}
