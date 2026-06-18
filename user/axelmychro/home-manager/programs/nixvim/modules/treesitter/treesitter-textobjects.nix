_: {
  programs.nixvim.plugins.treesitter-textobjects = {
    enable = true;

    settings = {
      enable = true;
      lookahead = true;
    };
  };
}
