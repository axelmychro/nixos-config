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
      brave
      mullvad-browser
      tor-browser

      # Clients
      linphone
      qbittorrent
      proton-vpn
      localsend
    ];
    programs.thunderbird.enable = true;
  };
  options.common.internet.enable = lib.mkEnableOption "Common desktop internet packages.";
}
