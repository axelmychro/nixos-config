_: {
  programs.fastfetch.enable = true;
  xdg.configFile = {
    "fastfetch/config.jsonc".source = ./config.jsonc;
    "fastfetch/nix.txt".source = ./src/nix.txt;

    "fastfetch/cconf.json".source = ./cconf.json;
    "fastfetch/closure.png".source = ./src/closure.png;
  };
}
