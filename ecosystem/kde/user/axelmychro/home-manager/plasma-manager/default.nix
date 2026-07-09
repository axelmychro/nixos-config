_: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
  imports = [
    ./desktop.nix
    ./devices.nix
    ./panels.nix
    ./power.nix
    ./session.nix
    ./shortcuts.nix
    ./window.nix
  ];
}
