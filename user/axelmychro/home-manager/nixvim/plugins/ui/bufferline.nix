_: {
  programs.nixvim = {
    plugins.bufferline.enable = true;
    keymaps = [
      {
        action = "<cmd>BufferLinePick<cr>";
        key = "<leader>bj";
        mode = [ "n" ];
        options.desc = "Pick Buffer";
      }
      {
        action = "<cmd>BufferLineCloseLeft<cr>";
        key = "<leader>bl";
        mode = [ "n" ];
        options.desc = "Delete Buffers to the Left";
      }
      {
        action = "<cmd>BufferLineTogglePin<cr>";
        key = "<leader>bp";
        mode = [ "n" ];
        options.desc = "Toggle Pin";
      }
      {
        action = "<cmd>BufferLineGroupClose ungrouped<cr>";
        key = "<leader>bP";
        mode = [ "n" ];
        options.desc = "Delete Non-Pinned Buffers";
      }
      {
        action = "<cmd>BufferLineCloseRight<cr>";
        key = "<leader>br";
        mode = [ "n" ];
        options.desc = "Delete Buffers to the Right";
      }
      {
        action = "<cmd>BufferLineCyclePrev<cr>";
        key = "[b";
        mode = [ "n" ];
        options.desc = "Prev Buffer";
      }
      {
        action = "<cmd>BufferLineMovePrev<cr>";
        key = "[B";
        mode = [ "n" ];
        options.desc = "Move buffer prev";
      }
      {
        action = "<cmd>BufferLineCycleNext<cr>";
        key = "]b";
        mode = [ "n" ];
        options.desc = "Next Buffer";
      }
      {
        action = "<cmd>BufferLineMoveNext<cr>";
        key = "]B";
        mode = [ "n" ];
        options.desc = "Move buffer next";
      }
      {
        action = "<cmd>BufferLineCyclePrev<cr>";
        key = "<S-h>";
        mode = [ "n" ];
        options.desc = "Prev Buffer";
      }
      {
        action = "<cmd>BufferLineCycleNext<cr>";
        key = "<S-l>";
        mode = [ "n" ];
        options.desc = "Next Buffer";
      }
    ];
  };
}
