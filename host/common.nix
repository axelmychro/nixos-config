{
  pkgs,
  users,
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

  # Network

  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_AU.UTF-8";

  networking.hosts = {
    "192.168.1.11" = [ "prts" ];
    "192.168.122.57" = [ "prts-web" ];
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ users.axelmychro.username ];
      MaxAuthTries = 3;
    };
  };

  # Config

  programs = {
    vim = {
      enable = true;
      defaultEditor = true;
    };

    git = {
      config = {
        init.defaultBranch = "main";
        pull.rebase = true;
        alias = {
          s = "status";
          r = "remote -v";
          l = "log --oneline";
          co = "checkout";
          f = "fetch";
          pl = "pull";
          ph = "push";
        };
      };

      enable = true;
    };
  };
}
