{ config, ... }: {
  services.resolved = {
    enable = true;

    settings.Resolve = {
      DNS = config.networking.nameservers;
      DNSOverTLS = true;
      DNSSEC = true;
      Domains = config.networking.search;
    };
  };
}
