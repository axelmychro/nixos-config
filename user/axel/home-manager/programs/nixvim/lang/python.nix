{ config, ... }:
{
  programs.nixvim = {
    plugins.lsp.servers.pyright.enable = true;

    plugins.conform-nvim.settings.formatters_by_ft = {
      python = [ "black" ];
    };

    plugins.treesitter.grammarPackages =
      with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [ python ];
  };
}
