{ config, ... }:
{
  programs.nixvim = {
    # rustaceanvim manages rust-analyzer internally
    # do NOT enable plugins.lsp.servers.rust-analyzer alongside this
    plugins = {
      rustaceanvim.enable = true;
      conform-nvim.settings.formatters_by_ft = {
        rust = [ "rustfmt" ];
      };
      treesitter.grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
        rust
      ];
    };
  };
}
