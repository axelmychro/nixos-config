{ pkgs, grammars, ... }:
{
  programs.nixvim = {
    plugins = {
      lsp.servers.pyright.enable = true;

      conform-nvim.settings.formatters_by_ft = {
        python = [ "black" ];
      };

      treesitter.grammarPackages = with grammars; [
        python
      ];
    };

    extraPackages = with pkgs; [
      black
    ];
  };
}
