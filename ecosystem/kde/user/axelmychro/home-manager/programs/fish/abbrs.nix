_: {
  programs.fish.shellAbbrs = {
    md = "mkdir -p";
    c = "cd";
    s = "sudo";
    e = "$EDITOR";
    sue = "sudoedit";
    g = "git";
    nxsh = "nix-shell -p";

    nc = "cd ~/nixos-config";

    mt = "mount";
    umt = "umount";

    ff = "fastfetch";
  };
}
