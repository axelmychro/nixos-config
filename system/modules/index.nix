_: {
  imports = [
    # ESSENTIAL
    ./boot/index.nix
    ./login/index.nix
    ./hardware/index.nix
    ./network/index.nix

    # OPTIONAL
    ./bluetooth/index.nix
    ./packages/index.nix
    ./home-manager/index.nix
    ./virtualisation/index.nix
  ];
}
