{
  programs.fish.shellAliases = {
    l = "eza --almost-all --long --group-directories-first --git";
    ll = "eza --long";
    lm = "eza --almost-all --long --sort=modified";
    lt = "eza --tree";
    t = "tmux attach 2>/dev/null; or tmux";
    cfetch = "fastfetch --config ~/.config/fastfetch/cconf.json";
  };
}
