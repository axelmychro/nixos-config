{
  imports = [
    ./configuration.nix
    ./modules/index.nix
  ];

  networking.hostName = "prts";
  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_AU.UTF-8";

  nix.settings = {
    trusted-users = [ "@wheel" ];
    cores = 8;
    max-jobs = 2;
  };
  services.fwupd.enable = true; # firmware update daemon
  zramSwap.enable = true; # 50% by default

  # WARNING: Should be a temporary option!

  #services.cloudflare-warp.enable = true;
}
