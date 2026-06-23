{
  config,
  pkgs,
  assets,
  plasma-manager,
  nixvim,
  ...
}:
let
  user = config.nixosConfigUsers.axelmychro;
in
{
  imports = [
    ./packages/index.nix
  ];

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

  system.activationScripts.face.text = ''
    _user_icon_dir=/var/lib/AccountsService/icons
    rm -fr -- "$_user_icon_dir/${user.name}"
    ln -sfn -- "${assets}/${user.name}/face.png" "$_user_icon_dir/${user.name}"
    unset _user_icon_dir
  '';

  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        plasma-manager
        ;
    };
    sharedModules = [ plasma-manager.homeModules.plasma-manager ];

    users.${user.name} = {
      home = {
        homeDirectory = "/home/${user.name}";
        stateVersion = "26.05"; # HM is developed against nixos-unstable
      };

      imports = [
        nixvim.homeModules.default
        ./home-manager
      ];
    };
  };

}
