{ pkgs, grammars, ... }:
{
  home.packages = with pkgs; [
    lua-language-server
    stylua
  ];
  programs.nixvim.plugins = {
    lsp.servers.lua_ls.enable = true;
    conform-nvim.settings.formatters_by_ft.lua = [ "stylua" ];
    treesitter.grammarPackages = with grammars; [ lua ];
  };
}
