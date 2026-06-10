{
  description = "Like a phoe-nix, cry and rise up from the ash!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };
    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      silentSDDM,
      plasma-manager,
      noctalia,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      assets = ./assets;
    in
    {
      nixosConfigurations = {
        skadi = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              system
              assets
              nixpkgs
              plasma-manager
              noctalia
              nixvim
              ;
          };
          modules = [
            { system.nixos.label = "abyss"; }
            home-manager.nixosModules.default
            silentSDDM.nixosModules.default
            nixvim.nixosModules.default

            ./host/prts/configuration.nix
            ./user/axelmychro/configuration.nix
            ./ecosystem/kde/index.nix
            #./ecosystem/niri/index.nix
          ];
        };
      };
    };
}
