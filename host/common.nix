{
  version,
  pkgs,
  lib,
  ...
}:
{
  # System

  system.stateVersion = version;
  boot.kernelPackages = lib.mkDefault pkgs.linuxKernel.packages.linux_6_18;

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

  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };
    firewall.enable = true;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
      "9.9.9.9"
      "149.112.112.112"
    ];

    hosts = {
      "192.168.1.11" = [ "prts" ];
      "192.168.122.185" = [ "prts-web" ];
    };
  };

  services.openssh = {
    enable = false;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ ];
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
    ".." = "cd ..";
    "..." = "cd ../..";
    s = "sudo";
    e = "$EDITOR";
    sue = "sudoedit";
    g = "git";
    nsh = "nix-shell";
    nc = "cd ~/nixos-config";
  };
}
