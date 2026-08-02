_: {
  programs.tmux = {
    enable = true;
    prefix = "C-z";
    keyMode = "vi";
    focusEvents = true;

    extraConfig = ''
      set-option -g status-style bg=#181926,fg=#cad3f5
    '';
  };
}
