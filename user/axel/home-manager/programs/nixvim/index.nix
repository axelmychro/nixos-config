_: {
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      autoLoad = true;
      settings.flavour = "macchiato";
    };

    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
      };
      conform-nvim.enable = true;
    };
  };
  imports = [ ./lang/index.nix ];
}
