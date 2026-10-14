{ pkgs, ... }: {
  networking.hostName = "prts-web";

  imports = [
    ./configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    nginx
    nodejs
    pnpm
  ];
  services.nginx = {
    virtualHosts."192.168.122.185" = {
      root = "/var/www/dist";
      addSSL = true;
      enableACME = true;
    };
    enable = true;
  };
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
  security.acme = {
    acceptTerms = true;
    defaults.email = "axelmychro@gmail.com";
  };
}
