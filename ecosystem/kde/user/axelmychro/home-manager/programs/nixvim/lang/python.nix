{ pkgs, grammars, ... }:
{
  home.packages = with pkgs; [
    pyright
    ruff
    black
  ];

  programs.nixvim = {
    plugins = {
      lsp.servers = {
        pyright.enable = true;
        ruff.enable = true;
      };

      conform-nvim.settings.formatters_by_ft.python = [ "black" ];

      treesitter.grammarPackages = with grammars; [
        python
      ];
    };
  };
}
