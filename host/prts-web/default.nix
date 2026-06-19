_: {
  networking.hostName = "prts-web";

  imports = [
    ../common.nix
  ];

  nix.settings = {
    cores = 2;
    max-jobs = 2;
  };
}
