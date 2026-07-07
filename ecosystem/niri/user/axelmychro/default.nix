{
  version,
  config,
  pkgs,
  noctalia,
  assets,
  ...
}:
let
  user = config.nixosConfigUsers.axelmychro;
in
{
  users.users.${user.name} = {
    shell = pkgs.fish;

    extraGroups = [
      "video"
      "render"
      "docker"
      "libvirtd"
    ];
  };
  programs.fish.enable = true;

  home-manager = {
    extraSpecialArgs = {
      inherit
        noctalia
        assets
        ;
    };

    users.${user.name} = {
      home = {
        homeDirectory = "/home/${user.name}";
        stateVersion = version; # HM is developed against nixos-unstable
      };

      imports = [
        ./home-manager
      ];
    };
  };

}
