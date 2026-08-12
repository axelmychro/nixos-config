{
  config,
  pkgs,
  assets,
  ...
}:
let
  file_name = "kiana-rose_pine_dawn_iris.png";
  wallpaper_file = "${assets}/wallpaper-${file_name}";
  out = "${config.home.homeDirectory}/Pictures/Wallpapers";
in
{
  home = {
    pointerCursor = {
      enable = true;
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 48;

      x11 = {
        enable = true;
        defaultCursor = "left_ptr";
      };
      gtk.enable = true;
    };
    activation.wallpaper = ''
      mkdir -p "${out}"
      cp -f "${wallpaper_file}" "${out}/${file_name}"
    '';
  };
}
