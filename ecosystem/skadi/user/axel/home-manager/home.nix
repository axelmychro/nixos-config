{
  noctalia,
  pkgs,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = { inherit noctalia; };
    users.axel = {
      xdg.configFile."niri/config.kdl".source = ../config/niri/config.kdl;
      imports = [
        ./noctalia-shell/index.nix
        ./programs/index.nix
        ./shell/index.nix
      ];

      gtk = {
        enable = true;
        theme = {
          name = "Nordic";
          package = pkgs.nordic;
        };
        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };
        cursorTheme = {
          name = "Nordic-Cursors";
          package = pkgs.nordic;
        };
      };
      qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "nordic";
      };
    };
  };
}
