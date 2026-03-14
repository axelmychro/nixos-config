_: {
  system.nixos.label = "skadi";

  imports = [
    ./system/index.nix
    ./user/axel/index.nix
  ];
}
