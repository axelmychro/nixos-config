_: {
  networking.hostName = "pts-skia";

  imports = [
    ./configuration.nix
  ];

  services.fwupd.enable = true; # firmware update daemon
  zramSwap.enable = true; # 50% by default

  environment.shellAliases.nc = "cd ~/nixos-config";
}
