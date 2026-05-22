_: {
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "macchiato";
    };
    colorscheme = "catppuccin";

    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
      };
      conform-nvim = {
        enable = true;
        settings.format_on_save = {
          timeout_ms = 500;
          lsp_fallback = true;
        };
      };
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };
    };
  };
  imports = [ ./lang/index.nix ];
}
