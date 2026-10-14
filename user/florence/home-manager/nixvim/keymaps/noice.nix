{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>lua require('noice.lsp').scroll(-4)<cr>";
      key = "<c-b>";
      mode = [
        "n"
        "i"
        "s"
      ];
      options.desc = "Scroll Backward";
    }
    {
      action = "<cmd>lua require('noice.lsp').scroll(4)<cr>";
      key = "<c-f>";
      mode = [
        "n"
        "i"
        "s"
      ];
      options.desc = "Scroll Forward";
    }
    {
      action = "";
      key = "<leader>sn";
      mode = [ "n" ];
      options.desc = "+noice";
    }
    {
      action = "<cmd>Noice all<cr>";
      key = "<leader>sna";
      mode = [ "n" ];
      options.desc = "Noice All";
    }
    {
      action = "<cmd>Noice dismiss<cr>";
      key = "<leader>snd";
      mode = [ "n" ];
      options.desc = "Dismiss All";
    }
    {
      action = "<cmd>Noice history<cr>";
      key = "<leader>snh";
      mode = [ "n" ];
      options.desc = "Noice History";
    }
    {
      action = "<cmd>Noice last<cr>";
      key = "<leader>snl";
      mode = [ "n" ];
      options.desc = "Noice Last Message";
    }
    {
      action = "<cmd>Noice telescope<cr>";
      key = "<leader>snt";
      mode = [ "n" ];
      options.desc = "Noice Picker (Telescope/FzfLua)";
    }
    {
      action = "<cmd>lua require('noice').redirect(vim.fn.getcmdline())<cr>";
      key = "<S-Enter>";
      mode = [ "c" ];
      options.desc = "Redirect Cmdline";
    }
  ];
}
