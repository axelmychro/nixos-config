_: {
  programs.nixvim.keymaps = [
    {
      key = "<leader>cF";
      options.desc = "Format Injected Langs";
      action = "<cmd>lua require('conform').format({ format_injected_lang = true })<cr>";
      mode = [
        "n"
        "x"
      ];
    }
  ];
}
