_: {
  programs.nixvim.plugins.mini-ai = {
    enable = true;

    settings = {
      n_line = 500;
      search_method = "cover_or_nearest";
      silent = true;
      # lazy_incomplete
    };
  };
}
