_: {
  programs.fish.shellAliases = {
    x = "sync; clear; exec fish";
    l = "eza -Ahl --group-directories-first --git";
    c = "cd";
    ".." = "cd ..";
    "..." = "cd ../..";
    md = "mkdir -p";
  };
}
