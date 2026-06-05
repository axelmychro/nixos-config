_: {
  imports = [
    # ESSENTIAL
    ./boot/index.nix
    ./login/index.nix
    ./hardware/index.nix
    ./network/index.nix

    # OPTIONAL
    #./graphics/index.nix
    ./audio/index.nix
    ./bluetooth/index.nix
    ./packages/index.nix
    ./home-manager/index.nix
    ./virtualisation/index.nix
  ];
}
