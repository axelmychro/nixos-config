{ theme, ... }:
let
  status_style = if theme == "rose-pine" then "bg=#1f1d2e,fg=#e0def4" else "bg=#f2e9e1,fg=#464261";
in
{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    prefix = "C-z";
    keyMode = "vi";
    focusEvents = true;

    extraConfig = ''
      set-option -g status-style ${status_style}
    '';
  };
}
