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
      home-manager,
      silentSDDM,
      plasma-manager,
      noctalia,
      nixvim,
      ...
    }@inputs:
    let
      mkConfig = import ./lib/mkconfig.nix { inherit inputs; };
    in
    {
      nixosConfigurations = {

        default = mkConfig "prts" {
          system = "x86_64-linux";
          users = [ "axelmychro" ];
        };

        kde = mkConfig "prts" {
          system = "x86_64-linux";
          type = "desktop";

          users = [
            "axelmychro"
            "priestess"
          ];

          gfx = [
            "intel"
            "nvidia"
          ];

          extraArgs = { inherit plasma-manager nixvim; };

          extraModules = [
            home-manager.nixosModules.default
            silentSDDM.nixosModules.default
            nixvim.nixosModules.default

            ./ecosystem/kde
            ./modules/flatpak
            ./modules/virtualisation/virt-manager.nix
            ./modules/virtualisation/docker.nix
          ];
        };

        web = mkConfig "prts-web" {
          system = "x86_64-linux";
          type = "server";

          users = [ "axelmychro" ];
        };
      };
    };
}
