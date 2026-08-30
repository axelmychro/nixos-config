{ wallpaper-file, ... }: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {
      wallpaper = wallpaper-file;
    };
  };
  #imports = [
  #  ./desktop.nix
  #  ./devices.nix
  #  ./panels.nix
  #  ./power.nix
  #  ./session.nix
  #  ./shortcuts.nix
  #  ./window.nix
  #];
}
