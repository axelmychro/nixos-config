{ config, ... }:
{
  programs.nixvim = {
    plugins = {
      nix.enable = true;
      lsp.servers.nixd.enable = true;
      conform-nvim.settings.formatters_by_ft = {
        nix = [ "nixfmt" ];
      };
      treesitter.grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
        nix
      ];
    };
  };
}
