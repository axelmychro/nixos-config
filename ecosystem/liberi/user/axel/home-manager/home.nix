{
  noctalia,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = { inherit noctalia; };
    users.axel = {
      xdg.configFile."niri/config.kdl".source = ../config/niri/config.kdl;
      imports = [
        ./programs/index.nix
        ./noctalia-shell/index.nix
      ];
    };
  };
}
