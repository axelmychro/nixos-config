{ pkgs, ... }: {
  networking.hostName = "prts-web";

  imports = [
    ../common.nix
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
    };
    enable = true;
  };
  networking.firewall.allowedTCPPorts = [ 80 ];
}
