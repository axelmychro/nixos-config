{
  description = "Like a phoe-nix, cry and rise up from the ash!";

  inputs = {
    ## Package manager
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    ## Desktop
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
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
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      # Essential
      nixpkgs,

      # Desktop
      home-manager,
      silentSDDM,
      plasma-manager,
      noctalia,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      version = "26.05";
      assets = ./assets;
    in
    {
      nixosConfigurations = {
        #PRTS
        main = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              system
              version
              assets
              plasma-manager
              noctalia
              nixvim
              ;
          };

          modules = [
            { system.nixos.label = "desktop"; }

            home-manager.nixosModules.default
            silentSDDM.nixosModules.default
            nixvim.nixosModules.default

            ./host/prts

            ./lib/nixosConfigUser.nix
            ./user/axelmychro
            ./user/priestess

            ./ecosystem/kde
            #./ecosystem/niri
          ];
        };

        ## PRTS-Web
        web = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              system
              version
              ;
          };

          modules = [
            { system.nixos.label = "server"; }

            ./host/prts-web

            ./lib/nixosConfigUser.nix
            ./user/axelmychro
          ];
        };
      };
    };
}
