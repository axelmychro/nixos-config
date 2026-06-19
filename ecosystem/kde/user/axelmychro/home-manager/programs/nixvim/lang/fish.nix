_: {
  programs.nixvim = {
    plugins = {
      lsp.servers.fish_lsp.enable = true;

      conform-nvim.settings.formatters_by_ft = {
        fish = [ "fish_indent" ];
      };

      #cmp-fish.enable = true;
    };
  };
}
