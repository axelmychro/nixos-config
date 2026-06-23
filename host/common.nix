{
  pkgs,
  config,
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
    "192.168.122.185" = [ "prts-web" ];
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ config.nixosConfigUsers.axelmychro.name ];
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

  environment.shellAliases = {
    x = "sync; clear; exec $SHELL";
    l = "ls -Ahl";
    lm = "ls -Ahlt";
    md = "mkdir -p";
    c = "cd";
    s = "sudo";
    e = "$EDITOR";
    sue = "sudoedit";
    g = "git";
    nxsh = "nix-shell -p";
  };
}
