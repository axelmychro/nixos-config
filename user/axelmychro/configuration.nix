{ pkgs, name, ... }:
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
    ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
  imports = [
    ./modules/packages/index.nix
    ./home-manager/home.nix
  ];
}
