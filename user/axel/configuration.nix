{ pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.bash;
    users.axel = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
    };
  };
  programs.fish.enable = true;
  imports = [
    ./modules/packages/index.nix
    ./modules/services/index.nix
    ./home-manager/home.nix
  ];
}
