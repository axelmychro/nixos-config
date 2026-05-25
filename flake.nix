{
  description = "Like a phoe-nix, cry and rise up from the ash!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
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
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      silentSDDM,
      plasma-manager,
      noctalia,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      assets = ./assets;
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      nixosConfigurations = {
        skadi = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              nixpkgs
              assets
              plasma-manager
              noctalia
              ;
          };
          modules = [
            ./system/configuration.nix
            ./user/axel/configuration.nix
            ./ecosystem/abyss/index.nix

            home-manager.nixosModules.home-manager
            silentSDDM.nixosModules.default
          ];
        };
      };
    };
}
