{
  pkgs,
  ...
}:
{
  system = {
    stateVersion = "26.05";
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_6_18;
    kernelModules = [ "ideapad_laptop" ];
  };

  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      cores = 6;
      max-jobs = 12;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
  };

  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "prts";
    hosts = {
      "192.168.122.204" = [ "web-prts" ];
    };
  };
  users.defaultUserShell = pkgs.bash;

  services.fwupd.enable = true; # firmware update daemon
  zramSwap.enable = true; # 50% by default

  imports = [
    ./hardware-configuration.nix
    ./modules/index.nix
  ];
}
