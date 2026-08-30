{
  imports = [
    ./binary-compatibility.nix
    ./terminal.nix
    ./gstreamer.nix
    ./multimedia.nix
    ./office.nix
    ./network.nix
    ./dev.nix
    ./games.nix
  ];
  common = {
    binaryCompatibility.enable = true;
    terminal.enable = true;
    gstreamer.enable = true;
    multimedia.enable = true;
    office.enable = true;
    network.enable = true;
    dev = {
      enable = true;
      ai.enable = false;
    };
    games.enable = true;
  };
}
