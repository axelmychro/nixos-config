_: {
  programs.nixvim.keymaps = [
    {
      key = "<c-s>";
      options.desc = "Toggle Flash Search";
      action = "<cmd>lua require('flash').toggle()<cr>";
      mode = [ "c" ];
    }
    {
      key = "r";
      options.desc = "Remote Flash";
      action = "<cmd>lua require('flash').remote()<cr>";
      mode = [ "o" ];
    }
    {
      key = "R";
      options.desc = "Treesitter Search";
      action = "<cmd>lua require('flash').treesitter_search()<cr>";
      mode = [
        "o"
        "x"
      ];
    }
    {
      key = "s";
      options.desc = "Flash";
      action = "<cmd>lua require('flash').jump()<cr>";
      mode = [
        "n"
        "o"
        "x"
      ];
    }
    {
      key = "S";
      options.desc = "Flash Treesitter";
      action = "<cmd>lua require('flash').treesitter()<cr>";
      mode = [
        "n"
        "o"
        "x"
      ];
    }
    {
      key = "<c-space>";
      options.desc = "Treesitter Incremental Selection";
      action = "<cmd>lua require('flash').treesitter()<cr>";
      mode = [
        "n"
        "o"
        "x"
      ];
    }
  ];
}
