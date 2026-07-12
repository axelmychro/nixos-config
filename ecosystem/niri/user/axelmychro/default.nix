{
  config,
  noctalia,
  assets,
  ...
}:
let
  user = config.nixosConfigUsers.axelmychro;
in
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        noctalia
        assets
        ;
    };

    users.${user.name}.imports = [
      ./home-manager
    ];
  };
}
