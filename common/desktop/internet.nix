{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.internet.enable {
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
  options.common.internet.enable = lib.mkEnableOption "Common desktop internet packages.";
}
