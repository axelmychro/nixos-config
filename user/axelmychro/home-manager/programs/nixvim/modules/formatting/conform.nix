{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;

    settings = {
      default_format_opts = {
        timeout_ms = 3000;
        async = false;
        quiet = false;
        lsp_format = "fallback";
      };

      format_on_save = {
        lsp_fallback = true;
      };

      formatters.injected.options.ignore_errors = true;
      log_level = "warn";
    };
  };
}
