_: {
  networking.hostName = "prts";

  imports = [
    ../common.nix
    ./configuration.nix
    ./modules/index.nix
  ];

  nix.settings = {
    cores = 12;
    max-jobs = 8;
  };
  services.fwupd.enable = true; # firmware update daemon
  zramSwap.enable = true; # 50% by default
}
