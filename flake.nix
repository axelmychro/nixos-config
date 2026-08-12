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
      version = "26.05";
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      mkConfig = import ./lib/mkconfig.nix { inherit inputs; };
    in
    {
      apps.${system} =
        builtins.mapAttrs
          (name: script: {
            type = "app";
            program = "${pkgs.writeShellScriptBin name script}/bin/${name}";
          })
          {
            build = ''
              git add -A
              nixos-rebuild --sudo boot --flake .#"$HOSTNAME"
            '';

            check = ''
              git add -A
              nixos-rebuild --sudo dry-run --flake .#"$HOSTNAME"
            '';

            clean = ''
              nix-collect-garbage --delete-old
              nix store optimise
            '';

            run = ''
              git add -A
              nixos-rebuild --sudo switch --flake .#"$HOSTNAME"
            '';

            update = ''
              git add -A
              nix flake update
            '';

            default = "nix run .#run";
          };

      nixosConfigurations = {
        prts = mkConfig "prts" {
          inherit version system;
          users = [
            "axelmychro"
            "priestess"
          ];

          ecosystem = "cosmic";
          extraArgs = { inherit nixvim; };
          extraModules = [
            nixvim.nixosModules.default

            ./modules/graphics/intel.nix
            ./modules/graphics/nvidia.nix

            #./modules/flatpak

            #./modules/virtualisation/virt-manager.nix
            #./modules/virtualisation/docker.nix
          ];
        };

        pts-skia = mkConfig "pts-skia" {
          users = [
            "axelmychro"
            "priestess"
          ];

          ecosystem = "cosmic";
        };

        prts-web = mkConfig "prts-web" {
          users = [ "axelmychro" ];
        };
      };
    };
}
