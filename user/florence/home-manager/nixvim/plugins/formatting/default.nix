{
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        settings = {
          # https://www.lazyvim.org/plugins/formatting#conformnvim
          default_format_opts = {
            async = false;
            lsp_format = "fallback";
            quiet = false;
            timeout_ms = 3000;
          };
          # https://github.com/stevearc/conform.nvim#setup
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
          formatters.injected.options.ignore_errors = true;
        };
      };
      lint.enable = true;
    };
    keymaps = [
      {
        action = "<cmd>lua require('conform').format({ format_injected_lang = true })<cr>";
        key = "<leader>cF";
        mode = [
          "n"
          "x"
        ];
        options.desc = "Format Injected Langs";
      }
    ];
  };
}
