_: {
  programs.nixvim.keymaps = [
    {
      key = "<c-b>";
      options.desc = "Scroll Backward";
      action = "<cmd>lua require('noice.lsp').scroll(-4)<cr>";
      mode = [
        "n"
        "i"
        "s"
      ];
    }
    {
      key = "<c-f>";
      options.desc = "Scroll Forward";
      action = "<cmd>lua require('noice.lsp').scroll(4)<cr>";
      mode = [
        "n"
        "i"
        "s"
      ];
    }
    {
      key = "<leader>sn";
      options.desc = "+noice";
      action = "";
      mode = [ "n" ];
    }
    {
      key = "<leader>sna";
      options.desc = "Noice All";
      action = "<cmd>Noice all<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>snd";
      options.desc = "Dismiss All";
      action = "<cmd>Noice dismiss<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>snh";
      options.desc = "Noice History";
      action = "<cmd>Noice history<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>snl";
      options.desc = "Noice Last Message";
      action = "<cmd>Noice last<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>snt";
      options.desc = "Noice Picker (Telescope/FzfLua)";
      action = "<cmd>Noice telescope<cr>";
      mode = [ "n" ];
    }
    {
      key = "<S-Enter>";
      options.desc = "Redirect Cmdline";
      action = "<cmd>lua require('noice').redirect(vim.fn.getcmdline())<cr>";
      mode = [ "c" ];
    }
  ];
}
