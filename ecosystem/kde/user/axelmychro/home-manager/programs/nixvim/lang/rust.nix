{ pkgs, grammars, ... }:
{
  home.packages = [
    pkgs.rustfmt
  ];

  programs.nixvim = {
    plugins = {
      rustaceanvim.enable = true;

      conform-nvim.settings.formatters_by_ft.rust = [ "rustfmt" ];

      treesitter.grammarPackages = [
        grammars.rust
      ];
    };
  };
}
