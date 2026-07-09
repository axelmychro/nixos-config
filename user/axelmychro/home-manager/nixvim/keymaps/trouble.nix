_: {
  programs.nixvim.keymaps = [
    {
      key = "<leader>cs";
      options.desc = "Symbols (Trouble)";
      action = "<cmd>Trouble symbols toggle<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>cS";
      options.desc = "LSP references/definitions/... (Trouble)";
      action = "<cmd>Trouble lsp toggle<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>xL";
      options.desc = "Location List (Trouble)";
      action = "<cmd>Trouble loclist toggle<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>xQ";
      options.desc = "Quickfix List (Trouble)";
      action = "<cmd>Trouble qflist toggle<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>xx";
      options.desc = "Diagnostics (Trouble)";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>xX";
      options.desc = "Buffer Diagnostics (Trouble)";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      mode = [ "n" ];
    }
    {
      key = "[q";
      options.desc = "Previous Trouble/Quickfix Item";
      action = "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>";
      mode = [ "n" ];
    }
    {
      key = "]q";
      options.desc = "Next Trouble/Quickfix Item";
      action = "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>";
      mode = [ "n" ];
    }
  ];
}
