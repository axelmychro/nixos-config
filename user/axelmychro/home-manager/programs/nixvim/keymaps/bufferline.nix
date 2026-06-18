_: {
  programs.nixvim.keymaps = [
    {
      key = "<leader>bj";
      options.desc = "Pick Buffer";
      action = "<cmd>BufferLinePick<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>bl";
      options.desc = "Delete Buffers to the Left";
      action = "<cmd>BufferLineCloseLeft<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>bp";
      options.desc = "Toggle Pin";
      action = "<cmd>BufferLineTogglePin<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>bP";
      options.desc = "Delete Non-Pinned Buffers";
      action = "<cmd>BufferLineGroupClose ungrouped<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>br";
      options.desc = "Delete Buffers to the Right";
      action = "<cmd>BufferLineCloseRight<cr>";
      mode = [ "n" ];
    }
    {
      key = "[b";
      options.desc = "Prev Buffer";
      action = "<cmd>BufferLineCyclePrev<cr>";
      mode = [ "n" ];
    }
    {
      key = "[B";
      options.desc = "Move buffer prev";
      action = "<cmd>BufferLineMovePrev<cr>";
      mode = [ "n" ];
    }
    {
      key = "]b";
      options.desc = "Next Buffer";
      action = "<cmd>BufferLineCycleNext<cr>";
      mode = [ "n" ];
    }
    {
      key = "]B";
      options.desc = "Move buffer next";
      action = "<cmd>BufferLineMoveNext<cr>";
      mode = [ "n" ];
    }
    {
      key = "<S-h>";
      options.desc = "Prev Buffer";
      action = "<cmd>BufferLineCyclePrev<cr>";
      mode = [ "n" ];
    }
    {
      key = "<S-l>";
      options.desc = "Next Buffer";
      action = "<cmd>BufferLineCycleNext<cr>";
      mode = [ "n" ];
    }
  ];
}
