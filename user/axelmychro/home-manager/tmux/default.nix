_: {
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    prefix = "C-z";
    keyMode = "vi";
    focusEvents = true;

    extraConfig = ''
      set-option -g status-style bg=#c6a0f6,fg=#24273a
    '';
  };
}
