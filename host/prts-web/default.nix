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
      locations."/" = {
        return = "200 '<html><body>It works</body></html>'";
        extraConfig = ''
          default_type text/html;
        '';
      };
    };

    enable = true;
  };
  networking.firewall.allowedTCPPorts = [ 80 ];
}
