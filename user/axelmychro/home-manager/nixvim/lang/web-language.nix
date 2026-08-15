{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prettier
    astro-language-server
  ];

  programs.nixvim = {
    plugins = {
      lsp.servers = {
        html.enable = true;
        cssls.enable = true;
        jsonls.enable = true;
        ts_ls.enable = true;
        vue_ls.enable = true;
        tailwindcss.enable = true;
      };

      conform-nvim.settings.formatters_by_ft = {
        html = [ "prettier" ];
        css = [ "prettier" ];
        # JS {
        javascript = [ "prettier" ];
        json = [ "prettier" ];
        jsonc = [ "prettier" ];
        typescript = [ "prettier" ];
        # }
        # React {
        javascriptreact = [ "prettier" ];
        typescriptreact = [ "prettier" ];
        # }
        vue = [ "prettier" ];
        astro = [ "prettier" ];
      };
    };
  };
}
