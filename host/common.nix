{
  pkgs,
  ...
}:
{
  # System

  system.stateVersion = "26.05";
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
  };
  #programs.nix-ld.enable = true;

  # Network

  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_AU.UTF-8";

  networking.hosts = {
    "192.168.1.11" = [ "prts" ];
    "192.168.122.57" = [ "prts-web" ];
  };
}
