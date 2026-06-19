_: {
  programs.nixvim.plugins.mini-pairs = {
    enable = true;

    settings = {
      modes = {
        insert = true;
        command = true;
        terminal = false;
      };
      # lazy_incomplete
    };
  };
}
