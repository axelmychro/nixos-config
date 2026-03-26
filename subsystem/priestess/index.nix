_: {
  system.nixos.label = "priestess";

  _module.args = {
    priestessAssets = ./assets;
  };

  imports = [
    ./system/configuration.nix
    ./user/axel/configuration.nix
  ];
}
