_: {
  imports = [
    # ESSENTIAL
    ./boot/index.nix
    ./login/index.nix
    ./hardware/index.nix
    ./network/index.nix

    # OPTIONAL
    ./packages/index.nix
    ./home-manager/index.nix
    ./services/index.nix
    ./virtualisation/index.nix
  ];
}
