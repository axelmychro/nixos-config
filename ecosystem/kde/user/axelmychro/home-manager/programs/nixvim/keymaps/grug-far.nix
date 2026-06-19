_: {
  programs.nixvim.keymaps = [
    {
      key = "<leader>sr";
      options.desc = "Search and Replace";
      action = "<cmd>lua require('grug-far').open()<cr>";
      mode = [
        "n"
        "x"
      ];
    }
  ];
}
