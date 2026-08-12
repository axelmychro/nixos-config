_: {
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    prefix = "C-z";
    keyMode = "vi";
    focusEvents = true;

    extraConfig = ''
      set-option -g status-style bg=#f2e9e1,fg=#464261
    '';
  };
}
