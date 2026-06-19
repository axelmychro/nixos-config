_: {
  networking.hostName = "prts";

  imports = [
    ../common.nix
    ./hardware-configuration.nix
    ./modules/index.nix
  ];

  boot.kernelModules = [ "ideapad_laptop" ];

  nix.settings = {
    cores = 12;
    max-jobs = 8;
  };
  services.fwupd.enable = true; # firmware update daemon
  zramSwap.enable = true; # 50% by default
}
