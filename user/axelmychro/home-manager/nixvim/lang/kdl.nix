{ pkgs, grammars, ... }:
{
  home.packages = [ pkgs.kdlfmt ];

  programs.nixvim = {
    plugins = {
      conform-nvim.settings.formatters_by_ft.kdl = [ "kdlfmt" ];

      treesitter.grammarPackages = [
        grammars.kdl
      ];
    };
  };
}
