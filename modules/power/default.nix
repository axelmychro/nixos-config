_: {
  imports = [
    ./thermald.nix
    ./upower.nix

    # WARN: Conflicting options, pick one!
    ./power-profiles-daemon.nix
    #./tlp.nix
    #./auto-cpufreq.nix
  ];
}
