{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.network.enable {
    environment.systemPackages = with pkgs; [
      # Browser
      google-chrome
      mullvad-browser
      tor-browser

      # Clients
      qbittorrent
      proton-vpn
      localsend
    ];
  };
  options.common.network.enable = lib.mkEnableOption "networking applications";
}
