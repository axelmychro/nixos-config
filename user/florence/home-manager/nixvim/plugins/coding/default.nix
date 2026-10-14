{
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;
      settings.keymap.preset = "enter";
    };
    blink-compat.enable = true;
  };
}
