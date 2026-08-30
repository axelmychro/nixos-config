{ pkgs, ... }: {
  imports = [
    ./configuration.nix
    ./modules/index.nix
  ];

  networking.hostName = "prts";
  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_AU.UTF-8";
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto-x86_64-v4;

  nix.settings = {
    trusted-users = [ "@wheel" ];
    cores = 12;
    max-jobs = 8;
  };
  services.fwupd.enable = true; # firmware update daemon
  zramSwap.enable = true; # 50% by default

  # WARNING: Should be a temporary option!

  #services.cloudflare-warp.enable = true;
}
