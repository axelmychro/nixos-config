{ pkgs, grammars, ... }:
{
  home.packages = [ pkgs.lemminx ];

  programs.nixvim = {
    plugins = {
      lsp.servers.lemminx.enable = true;

      conform-nvim.settings.formatters_by_ft.xml = [ "lemminx" ];

      treesitter.grammarPackages = [ grammars.xml ];
    };
  };
}
