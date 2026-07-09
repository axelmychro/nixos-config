{ pkgs, grammars, ... }:
{
  home.packages = [
    pkgs.shfmt
  ];

  programs.nixvim = {
    plugins = {
      lsp.servers.bashls.enable = true;

      conform-nvim.settings.formatters_by_ft = {
        bash = [ "shfmt" ];
        sh = [ "shfmt" ];
      };

      treesitter.grammarPackages = with grammars; [
        bash
      ];
    };
  };
}
