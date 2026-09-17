{
  config,
  inputs,
  pkgs,
  theme,
  ...
}:
{
  imports = [ inputs.stylix.homeModules.stylix ];
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

    fonts = {
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      monospace = {
        package = pkgs.nerd-fonts.go-mono;
        name = "GoMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    targets = {
      btop.enable = true;
      cava.enable = true;
      gnome.enable = true;
      gtk.enable = true;
      kde.enable = true;
      qt.enable = true;
      zed.enable = true;
    };
  };

  #home.file.".gtkrc-2.0".force = true;
  xdg.configFile = {
    "gtk-3.0/settings.ini".force = true;
    "gtk-4.0/settings.ini".force = true;
  };

  xdg.configFile = {
    "qt5ct/qt5ct.conf".force = true;
    "qt6ct/qt6ct.conf".force = true;
  };

}
