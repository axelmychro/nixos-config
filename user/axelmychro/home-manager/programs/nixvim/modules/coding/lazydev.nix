_: {
  programs.nixvim.plugins.lazydev = {
    enable = true;

    settings = {
      library = [
        # lazy_incomplete
        {
          path = "LazyVim";
          words = [ "LazyVim" ];
        }
        {
          path = "snacks.nvim";
          words = [ "Snacks" ];
        }
        {
          path = "lazy.nvim";
          words = [ "LazyVim" ];
        }
        {
          path = "nvim-lspconfig";
          words = [ "lspconfig.settings" ];
        }
      ];
    };
  };
}
