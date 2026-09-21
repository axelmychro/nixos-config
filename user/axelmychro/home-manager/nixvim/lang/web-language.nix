{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prettier
    rustywind
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
        html = [
          "prettier"
          "rustywind"
        ];
        css = [
          "prettier"
          "rustywind"
        ];
        # JS {
        javascript = [
          "prettier"
          "rustywind"
        ];
        json = [
          "prettier"
          "rustywind"
        ];
        jsonc = [
          "prettier"
          "rustywind"
        ];
        typescript = [
          "prettier"
          "rustywind"
        ];
        # }
        # React {
        javascriptreact = [
          "prettier"
          "rustywind"
        ];
        typescriptreact = [
          "prettier"
          "rustywind"
        ];
        # }
        vue = [
          "prettier"
          "rustywind"
        ];
        astro = [
          "prettier"
          "rustywind"
        ];
      };
    };
  };
}
