{
  assets,
  noctalia,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        noctalia
        ;
    };
    users.axel = {
      imports = [
        ./niri/index.nix
        ./noctalia/index.nix
      ];
    };
  };
}
