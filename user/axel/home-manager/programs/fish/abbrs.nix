_: {
  programs.fish.shellAbbrs = {
    s = "sudo";
    c = "cd";
    md = "mkdir -p";
    e = "$EDITOR";
    cn = "cd ~/nixos-config";

    mt = "mount";
    umt = "umount";

    t = "btop";
    ff = "fastfetch";
    g = "git";
    nxsh = "nix-shell";
  };
}
