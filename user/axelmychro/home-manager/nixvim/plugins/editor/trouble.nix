{
  programs.nixvim = {
    plugins.trouble.enable = true;
    keymaps = [
      {
        action = "<cmd>Trouble symbols toggle<cr>";
        key = "<leader>cs";
        mode = [ "n" ];
        options.desc = "Symbols (Trouble)";
      }
      {
        action = "<cmd>Trouble lsp toggle<cr>";
        key = "<leader>cS";
        mode = [ "n" ];
        options.desc = "LSP references/definitions/... (Trouble)";
      }
      {
        action = "<cmd>Trouble loclist toggle<cr>";
        key = "<leader>xL";
        mode = [ "n" ];
        options.desc = "Location List (Trouble)";
      }
      {
        action = "<cmd>Trouble qflist toggle<cr>";
        key = "<leader>xQ";
        mode = [ "n" ];
        options.desc = "Quickfix List (Trouble)";
      }
      {
        action = "<cmd>Trouble diagnostics toggle<cr>";
        key = "<leader>xx";
        mode = [ "n" ];
        options.desc = "Diagnostics (Trouble)";
      }
      {
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        key = "<leader>xX";
        mode = [ "n" ];
        options.desc = "Buffer Diagnostics (Trouble)";
      }
      {
        action = "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>";
        key = "[q";
        mode = [ "n" ];
        options.desc = "Previous Trouble/Quickfix Item";
      }
      {
        action = "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>";
        key = "]q";
        mode = [ "n" ];
        options.desc = "Next Trouble/Quickfix Item";
      }
    ];
  };
}
