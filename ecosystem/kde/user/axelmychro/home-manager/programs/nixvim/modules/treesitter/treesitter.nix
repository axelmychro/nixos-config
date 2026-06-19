{ pkgs, grammars, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [ tree-sitter ];

    plugins.treesitter = {
      enable = true;

      grammarPackages = with grammars; [ regex ];

      indent.enable = true;
      highlight.enable = true;
      folding.enable = false;
    };
  };
}
