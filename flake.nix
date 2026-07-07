{
  description = "Like a phoe-nix, cry and rise up from the ash!";

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

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
      url = "github:noctalia-dev/noctalia/cachix";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
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

        prts = mkConfig "prts" {
          system = "x86_64-linux";
          users = [
            "axelmychro"
            "priestess"
          ];

          type = "laptop";
          ecosystem = "kde";

          extraArgs = { inherit nixvim; };
          extraModules = [
            nixvim.nixosModules.default

            ./modules/graphics/intel.nix
            ./modules/graphics/nvidia.nix

            ./modules/flatpak

            ./modules/virtualisation/virt-manager.nix
            ./modules/virtualisation/docker.nix
          ];
        };

        pts-skia = mkConfig "pts-skia" {
          system = "x86_64-linux";
          type = "desktop";

          users = [
            "axelmychro"
            "priestess"
          ];

          extraModules = [
            ./ecosystem/gnome
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
