_: {
  system.nixos.label = "priestess";

  imports = [
    ./system/index.nix
    ./user/axel/index.nix
  ];
}
