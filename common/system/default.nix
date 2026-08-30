{
  lib,
  pkgs,
  version,
  ...
}:
{
  #
  # System
  #

  system.stateVersion = lib.mkForce version;
  boot.kernelPackages = lib.mkDefault pkgs.linuxKernel.packages.linux_6_18;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-old";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  nixpkgs.config.allowUnfree = lib.mkForce true;

  #
  # Network
  #
  networking = {
    firewall = {
      # NOTE: Don't check for most VPNs to work.
      #checkReversePath = false;
      enable = true;
    };
    hosts = {
      "192.168.1.11" = [ "prts" ];
      "192.168.122.185" = [ "prts-web" ];
    };
    nameservers = [
      # NextDNS
      "45.90.28.28"
      "45.90.30.28"
    ];
    networkmanager = {
      enable = true;
      #dns = "none";
    };
  };
  services.openssh = {
    enable = false;
    openFirewall = true;
    settings = {
      AllowUsers = [ ];
      KbdInteractiveAuthentication = false;
      MaxAuthTries = 3;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  #
  # Config
  #

  programs = {
    git = {
      config = {
        alias = {
          co = "checkout";
          f = "fetch";
          l = "log --oneline";
          ph = "push";
          pl = "pull";
          r = "remote -v";
          s = "status";
        };
        init.defaultBranch = "main";
        pull.rebase = true;
      };
      enable = lib.mkDefault true;
    };
    vim = {
      defaultEditor = lib.mkDefault true;
      enable = lib.mkDefault true;
    };
  };

  environment.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    c = "cd";
    e = "$EDITOR";
    g = "git";
    l = "ls -Ahl";
    lm = "ls -Ahlt";
    md = "mkdir -p";
    nc = "cd ~/nixos-config";
    nsh = "nix-shell";
    s = "sudo";
    sue = "sudoedit";
    x = "sync; clear; exec $SHELL";
  };
}
