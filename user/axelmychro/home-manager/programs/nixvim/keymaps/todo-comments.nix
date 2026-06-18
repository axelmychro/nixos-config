_: {
  programs.nixvim.keymaps = [
    {
      key = "<leader>st";
      options.desc = "Todo";
      action = "<cmd>TodoTelescope<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sT";
      options.desc = "Todo/Fix/Fixme";
      action = "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>xt";
      options.desc = "Todo (Trouble)";
      action = "<cmd>TodoTrouble<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>xT";
      options.desc = "Todo/Fix/Fixme (Trouble)";
      action = "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>";
      mode = [ "n" ];
    }
    {
      key = "[t";
      options.desc = "Previous Todo Comment";
      action = "<cmd>lua require('todo-comments').jump_prev()<cr>";
      mode = [ "n" ];
    }
    {
      key = "]t";
      options.desc = "Next Todo Comment";
      action = "<cmd>lua require('todo-comments').jump_next()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>st";
      options.desc = "Todo";
      action = "<cmd>TodoTelescope<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sT";
      options.desc = "Todo/Fix/Fixme";
      action = "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>";
      mode = [ "n" ];
    }
  ];
}
