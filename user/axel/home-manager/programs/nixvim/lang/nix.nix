{ config, ... }:
{
  programs.nixvim = {
    plugins.nix.enable = true;
    plugins.lsp.servers.nixd.enable = true;

    plugins.conform-nvim.settings.formatters_by_ft = {
      nix = [ "nixfmt" ];
    };

    plugins.treesitter.grammarPackages =
      with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
        nix
      ];
  };
}
