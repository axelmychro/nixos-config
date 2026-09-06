{
  lib,
  pkgs,
  config,
  ...
}:
{

  config = lib.mkIf config.common.terminal.enable {
    environment.systemPackages = with pkgs; [
      # Emulator
      kitty

      # Main
      wl-clipboard # useful "... | wl-copy" pipe
      yazi
      btop
      gdu
      tree
      wiremix
      fastfetch
      kew

      ## Archive
      zip
      unzip
      rar
      unrar
      p7zip

      ## Forensic
      sherlock
      exiftool
      steghide
      stegseek
      zsteg
    ];
  };
  options.common.terminal.enable = lib.mkEnableOption "Common desktop terminal options.";
}
