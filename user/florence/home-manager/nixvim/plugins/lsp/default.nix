{
  programs.nixvim.plugins = {
    # https://www.lazyvim.org/plugins/lsp#nvim-lspconfig
    lsp = {
      enable = true;
      inlayHints = true;
    };
    lspconfig.enable = false;
  };
}
