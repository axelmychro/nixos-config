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
      wget
      wl-clipboard # useful "... | wl-copy" pipe
      yazi
      btop
      gdu
      tree
      fastfetch
      wiremix
      kew
      glow

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
