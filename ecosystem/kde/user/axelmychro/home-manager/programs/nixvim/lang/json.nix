{ pkgs, ... }:
{
  home.packages = [
    pkgs.prettier
  ];

  programs.nixvim = {
    plugins = {
      lsp.servers.jsonls.enable = true;

      conform-nvim.settings.formatters_by_ft = {
        json = [ "prettier" ];
        jsonc = [ "prettier" ];
      };
    };
  };
}
