_: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      inlayHints = true;
    };
    lspconfig = {
      enable = false;
    };
  };
}
