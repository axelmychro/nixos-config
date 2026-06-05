_: {
  imports = [
    ./thermald.nix
    ./upower.nix

    # -- Choose one
    ./power-profiles-daemon.nix
    #./tlp.nix
    #./auto-cpufreq.nix
  ];
}
