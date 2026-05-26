_: {
  programs.alacritty = {
    enable = true;
    settings = {
      general.live_config_reload = false;
      window.padding = {
        x = 0;
        y = 0;
      };
      font = {
        normal.family = "GeistMono Nerd Font";
        size = 16;
      };
      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
      };
      mouse.hide_when_typing = true;
    };
    theme = "catppuccin_macchiato";
  };
}
