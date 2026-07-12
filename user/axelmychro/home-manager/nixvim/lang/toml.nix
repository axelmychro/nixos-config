{ pkgs, grammars, ... }:
{
  home.packages = [ pkgs.taplo ];

  programs.nixvim = {
    plugins = {
      conform-nvim.settings.formatters_by_ft.toml = [ "taplo" ];

      treesitter.grammarPackages = [
        grammars.toml
      ];
    };
  };
}
