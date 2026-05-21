{ config, ... }:
{
  programs.nixvim = {
    plugins.lsp.servers.bashls.enable = true;

    plugins.conform-nvim.settings.formatters_by_ft = {
      bash = [ "shfmt" ];
      sh = [ "shfmt" ];
    };

    plugins.treesitter.grammarPackages =
      with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
        bash
      ];
  };
}
