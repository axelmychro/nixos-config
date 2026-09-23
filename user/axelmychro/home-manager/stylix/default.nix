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
      # NOTE: Disabled targets were tested
      #       and found to be unpleasant to look at
      #       or that I already themed them manually.

      btop.enable = true;
      cava.enable = false;
      # Nixcord NOTE: Light styles fail to affect white texts.
      #               Unreadable. Theme manually or use dark styles
      nixcord.enable = false;
      fontconfig.enable = true;
      gdu.enable = false;
      gnome.enable = true;
      gtk.enable = true;
      kde.enable = true;
      lazygit.enable = true;
      nixvim.enable = false;
      qt.enable = true;
      yazi.enable = false;
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
