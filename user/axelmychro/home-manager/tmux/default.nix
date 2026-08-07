_: {
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    prefix = "C-z";
    keyMode = "vi";
    focusEvents = true;

    extraConfig = ''
      set-option -g status-style bg=#1e2030,fg=#cad3f5
    '';
  };
}
