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
    users.axelmychro = {
      imports = [
        ./niri/index.nix
        ./noctalia/index.nix
      ];
    };
  };
}
