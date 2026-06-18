_: {
  programs.nixvim.plugins.snacks = {
    enable = true;

    settings = {
      indent = {
        enabled = true;
      };
      input = {
        enabled = true;
      };
      notifier = {
        enabled = true;
      };
      scope = {
        enabled = true;
      };
      scroll = {
        enabled = true;
      };
      statuscolumn = {
        enabled = false;
      };
      words = {
        enabled = true;
      };
    };
  };
}
