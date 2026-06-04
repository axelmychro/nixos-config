_: {
  networking = {
    networkmanager = {
      enable = true; # this thing enables internet at all
      dns = "none";
    };
    firewall = {
      enable = true;
      allowPing = true;
      logReversePathDrops = true;
    };
    nameservers = [
      "9.9.9.9"
    ];
  };

  services.resolved = {
    enable = false;
    settings.Resolve = {
      DNSOverTLS = "true";
      DNSSEC = "true";
      Domains = [ "~." ];
    };
  };
  services.cloudflare-warp.enable = false; # conflicts with resolved
}
