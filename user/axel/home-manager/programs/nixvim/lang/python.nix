{ config, ... }:
{
  programs.nixvim = {
    plugins = {
      lsp.servers.pyright.enable = true;
      conform-nvim.settings.formatters_by_ft = {
        python = [ "black" ];
      };
      treesitter.grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
        python
      ];
    };
  };
}
