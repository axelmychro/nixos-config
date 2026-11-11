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
      #firefox

      # Clients
      linphone
      qbittorrent
      proton-vpn
      localsend
    ];
    #programs.thunderbird.enable = true;
  };
  options.common.internet.enable = lib.mkEnableOption "Common desktop internet packages.";
}
