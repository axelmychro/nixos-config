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

  networking.hostName = "mychro";
  users.defaultUserShell = pkgs.bash;

  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";

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
  services.fwupd.enable = true; # linux FOSS firmware update daemon
  zramSwap.enable = true; # 50% by default

  imports = [
    ./hardware-configuration.nix
    ./modules/index.nix
  ];
}
