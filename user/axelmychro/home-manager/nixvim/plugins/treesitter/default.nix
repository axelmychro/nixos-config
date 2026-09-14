{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      indent.enable = true;
      highlight.enable = true;
      folding.enable = false;
    };
    ts-autotag.enable = true;
  };
}
