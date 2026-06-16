{
  pkgs,
  assets,
  name,
  ...
}:
{
  _module.args = {
    name = "axelmychro";
  };
  users.users.${name} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "render"
      "docker"
      "libvirtd"
    ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
  imports = [
    ./modules/packages/index.nix
    ./home-manager/home.nix
  ];
  system.activationScripts.face = {
    text = ''
      rm -f /var/lib/AccountsService/icons/${name}
      ln -sfn ${assets}/face.jpg /var/lib/AccountsService/icons/${name}
    '';
  };
}
