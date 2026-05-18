{
  noctalia,
  assets,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        noctalia
        assets
        ;
    };
    users.axel = {
      imports = [
        ./niri/index.nix
        ./noctalia-shell/index.nix
      ];
    };
  };
}
