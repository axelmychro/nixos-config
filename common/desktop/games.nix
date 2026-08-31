{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.games.enable {
    environment.systemPackages = with pkgs; [
      # Winery
      protonplus
      wineWow64Packages.waylandFull
      winetricks

      # Launcher
      heroic
      osu-lazer-bin
      prismlauncher
    ];
    programs.steam = {
      package = pkgs.millennium-steam;
      enable = true;
    };
    programs.gamemode.enable = true;
  };
  options.common.games.enable = lib.mkEnableOption "Common desktop games options.";
}
