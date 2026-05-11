{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      qt6.qtbase
      qt6.qt5compat
      qt6.qttools
      qt6.qtpositioning
      qt6.qtdeclarative
      # qt6.qtdeclarative depends on libglvnd
      libglvnd
      qtcreator
      gcc
      gnumake
      cmake
      gdb
    ];
  };
}
