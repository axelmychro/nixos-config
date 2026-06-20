_: {
  networking.hostName = "prts-web";

  imports = [
    ../common.nix
    ./configuration.nix
  ];

  nix.settings = {
    cores = 2;
    max-jobs = 2;
  };
}
