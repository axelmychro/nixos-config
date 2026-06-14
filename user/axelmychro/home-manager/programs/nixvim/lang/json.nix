{ pkgs, grammars, ... }:
{
  programs.nixvim = {
    plugins = {
      lsp.servers.jsonls.enable = true;

      conform-nvim.settings.formatters_by_ft = {
        json = [ "prettier" ];
        jsonc = [ "prettier" ];
      };

      treesitter.grammarPackages = with grammars; [
      ];
    };

    extraPackages = with pkgs; [
      prettier
    ];
  };
}
