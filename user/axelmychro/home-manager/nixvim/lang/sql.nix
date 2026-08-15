{ pkgs, grammars, ... }:
{
  home.packages = [
    pkgs.sql-formatter
  ];

  programs.nixvim = {
    plugins = {
      #lsp.servers.sqls.enable = true;

      conform-nvim.settings = {
        formatters_by_ft.sql = [ "sql-formatter" ];

        formatters.sql-formatter = {
          command = "sql-formatter";
          stdin = true;
        };
      };

      treesitter.grammarPackages = [
        grammars.sql
      ];
    };
  };
}
