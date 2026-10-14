{
  config,
  ...
}:
{
  nixosConfigUsers.priestess = {
    name = "priestess";
    configuration = ./default.nix;
  };

  users.users.${config.nixosConfigUsers.priestess.name} = {
    isNormalUser = true;
    extraGroups = [ ];
  };
}
