_: {
  networking.hostName = "prts";

  imports = [
    ./configuration.nix
    ./modules/index.nix
  ];

  nix.settings = {
    trusted-users = [
      "root"
      "axelmychro"
    ];
    cores = 12;
    max-jobs = 8;
  };
  services.fwupd.enable = true; # firmware update daemon
  zramSwap.enable = true; # 50% by default
}
