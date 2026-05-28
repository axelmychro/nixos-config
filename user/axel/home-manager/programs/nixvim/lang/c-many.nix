{ config, ... }:
{
  programs.nixvim = {
    plugins = {
      lsp.servers.clangd.enable = true;
      conform-nvim.settings.formatters_by_ft = {
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
        objc = [ "clang-format" ];
        cuda = [ "clang-format" ];
      };
      treesitter.grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
        c
        cpp
        cuda
      ];
    };
  };
}
