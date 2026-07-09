_: {
  programs.nixvim.keymaps = [
    {
      key = "<leader>qd";
      options.desc = "Don't Save Current Session";
      action = "<cmd>lua require('persistence').stop()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ql";
      options.desc = "Restore Last Session";
      action = "<cmd>lua require('persistence').load({ last = true })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>qs";
      options.desc = "Restore Session";
      action = "<cmd>lua require('persistence').load()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>qS";
      options.desc = "Select Session";
      action = "<cmd>lua require('persistence').select()<cr>";
      mode = [ "n" ];
    }
  ];
}
