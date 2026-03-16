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
      "1.1.1.1"
    ];
  };

  services.resolved = {
    enable = false;
    dnsovertls = "true";
    dnssec = "true";
    domains = [ "~." ];
  };
  services.cloudflare-warp.enable = false; # conflicts with resolved
}
