_: {
  programs.fish.shellAbbrs = {
    e = "\"$EDITOR\"";
    ff = "fastfetch";
  };
  imports = [
    ./git.nix
    ./nix.nix
  ];
}
