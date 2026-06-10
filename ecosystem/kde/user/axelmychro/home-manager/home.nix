{
  assets,
  plasma-manager,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        plasma-manager
        ;
    };
    sharedModules = [ plasma-manager.homeModules.plasma-manager ];
    users.axelmychro = {
      imports = [
        ./plasma-manager/index.nix
      ];
    };
  };
}
