{ config, ... }:
{
  programs.nixvim = {
    enable = true;
  };

  imports = [
    ./general.nix
    ./keymaps/index.nix
    ./modules/index.nix
    ./lang/index.nix
  ];
}
