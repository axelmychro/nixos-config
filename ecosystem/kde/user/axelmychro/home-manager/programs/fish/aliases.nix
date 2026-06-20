_: {
  programs.fish.shellAliases = {
    x = "sync; clear; exec $SHELL";
    l = "eza --almost-all --long --group-directories-first --git";
    lm = "l --sort=modified";
    ".." = "cd ..";
    "..." = "cd ../..";
    t = "tmux attach 2>/dev/null; or tmux";
  };
}
