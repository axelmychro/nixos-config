_: {
  system.nixos.label = "abyss";
  imports = [
    ./system/configuration.nix
    ./user/axel/configuration.nix
  ];
}
