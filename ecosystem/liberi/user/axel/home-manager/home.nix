{
  noctalia,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = { inherit noctalia; };
    users.axel = {
      xdg.configFile."niri/config.kdl".source = ../config/config.kdl;
      imports = [
        ./programs/index.nix
        ./noctalia-shell/index.nix
      ];
    };
  };
}
