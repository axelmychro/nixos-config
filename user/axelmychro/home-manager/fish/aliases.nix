_: {
  programs.fish.shellAliases = {
    l = "eza --almost-all --long --group-directories-first --git";
    lm = "l --sort=modified";
    t = "tmux attach 2>/dev/null; or tmux";
    zfetch = "fastfetch --config ~/.config/fastfetch/zconf.json";
  };
}
