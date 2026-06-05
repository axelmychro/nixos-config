{ pkgs, ... }:
{
  users.users.axel = {
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
