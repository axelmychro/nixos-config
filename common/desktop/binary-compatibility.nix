{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.binaryCompatibility.enable {
    environment.systemPackages = with pkgs; [
      binutils
      steam-run
    ];
    programs = {
      nix-ld = {
        enable = true;
      };
      fuse = {
        enable = true;
        userAllowOther = true;
      };
      appimage = {
        enable = true;
        binfmt = true;
        # NOTE: This option cures this disease,
        #       """
        #       *: error while loading shared libraries:
        #       lib*: cannot open shared object file:
        #       No such file or directory
        #       """
        package = pkgs.appimage-run.override {
          extraPkgs =
            pkgs: with pkgs; [
              webkitgtk_4_1
              libsoup_3
            ];
        };
      };
    };
  };
  options.common.binaryCompatibility.enable = lib.mkEnableOption "Common binary compatibility options.";
}
