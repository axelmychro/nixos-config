{
  imports = [
    ./display-manager.nix

    ./binary-compatibility.nix
    ./development.nix
    ./games.nix
    ./graphics.nix
    ./gstreamer.nix
    ./internet.nix
    ./multimedia.nix
    ./office.nix
    ./terminal.nix
    ./utilities.nix
  ];
  common = {
    binaryCompatibility.enable = true;
    development = {
      enable = true;
      ai.enable = false;
    };
    games.enable = true;
    graphics.enable = true;
    gstreamer.enable = true;
    internet.enable = true;
    multimedia.enable = true;
    office.enable = true;
    terminal.enable = true;
    utilities.enable = true;
  };
}
