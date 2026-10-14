{ pkgs, grammars, ... }:
{
  home.packages = [ pkgs.clang-tools ];

  programs.nixvim = {
    plugins = {
      lsp.servers.clangd.enable = true;

      conform-nvim.settings.formatters_by_ft = {
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
      };

      treesitter.grammarPackages = with grammars; [
        c
        cpp
      ];
    };
  };
}
