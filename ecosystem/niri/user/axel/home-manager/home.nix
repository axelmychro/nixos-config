{
  assets,
  plasma-manager,
  noctalia,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        plasma-manager
        noctalia
        ;
    };
    sharedModules = [ plasma-manager.homeModules.plasma-manager ];
    users.axel = {
      imports = [
        ./niri/index.nix
        ./noctalia-shell/index.nix
      ];
    };
  };
}
