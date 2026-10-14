{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Telescope lsp_definitions<cr>";
      key = "gd";
      mode = [
        "n"
        "n"
      ];
      options.desc = "Goto Definition";
    }
    {
      action = "<cmd>Telescope lsp_references<cr>";
      key = "gr";
      mode = [
        "n"
        "n"
      ];
      options.desc = "References";
    }
    {
      action = "<cmd>Telescope lsp_implementations<cr>";
      key = "gI";
      mode = [
        "n"
        "n"
      ];
      options.desc = "Goto Implementation";
    }
    {
      action = "<cmd>Telescope lsp_type_definitions<cr>";
      key = "gy";
      mode = [
        "n"
        "n"
      ];
      options.desc = "Goto T[y]pe Definition";
    }
    {
      action = "<cmd>lua vim.lsp.buf.declaration()<cr>";
      key = "gD";
      mode = [ "n" ];
      options.desc = "Goto Declaration";
    }
    {
      action = "<cmd>lua vim.lsp.buf.hover()<cr>";
      key = "K";
      mode = [ "n" ];
      options.desc = "Hover";
    }
    {
      action = "<cmd>lua vim.lsp.buf.signature_help()<cr>";
      key = "gK";
      mode = [ "n" ];
      options.desc = "Signature Help";
    }
    {
      action = "<cmd>lua vim.lsp.buf.signature_help()<cr>";
      key = "<c-k>";
      mode = [ "i" ];
      options.desc = "Signature Help";
    }
    {
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
      key = "<leader>ca";
      mode = [
        "n"
        "x"
      ];
      options.desc = "Code Action";
    }
    {
      action = "<cmd>lua vim.lsp.codelens.run()<cr>";
      key = "<leader>cc";
      mode = [
        "n"
        "x"
      ];
      options.desc = "Run Codelens";
    }
    {
      action = "<cmd>lua vim.lsp.codelens.refresh()<cr>";
      key = "<leader>cC";
      mode = [ "n" ];
      options.desc = "Refresh & Display Codelens";
    }
    {
      action = "<cmd>lua require('snacks').rename.rename_file()<cr>";
      key = "<leader>cR";
      mode = [ "n" ];
      options.desc = "Rename File";
    }
    {
      action = "<cmd>lua vim.lsp.buf.rename()<cr>";
      key = "<leader>cr";
      mode = [ "n" ];
      options.desc = "Rename";
    }
    {
      action = "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source' } } })<cr>";
      key = "<leader>cA";
      mode = [ "n" ];
      options.desc = "Source Action";
    }
    {
      action = "<cmd>lua require('illuminate').goto_next_reference()<cr>";
      key = "]]";
      mode = [ "n" ];
      options.desc = "Next Reference";
    }
    {
      action = "<cmd>lua require('illuminate').goto_prev_reference()<cr>";
      key = "[[";
      mode = [ "n" ];
      options.desc = "Prev Reference";
    }
    {
      action = "<cmd>lua require('illuminate').goto_next_reference()<cr>";
      key = "<a-n>";
      mode = [ "n" ];
      options.desc = "Next Reference";
    }
    {
      action = "<cmd>lua require('illuminate').goto_prev_reference()<cr>";
      key = "<a-p>";
      mode = [ "n" ];
      options.desc = "Prev Reference";
    }
    {
      action = "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } } })<cr>";
      key = "<leader>co";
      mode = [ "n" ];
      options.desc = "Organize Imports";
    }
    {
      action = "<cmd>Telescope lsp_document_symbols<cr>";
      key = "<leader>ss";
      mode = [ "n" ];
      options.desc = "LSP Symbols";
    }
    {
      action = "<cmd>Telescope lsp_workspace_symbols<cr>";
      key = "<leader>sS";
      mode = [ "n" ];
      options.desc = "LSP Workspace Symbols";
    }
    {
      action = "<cmd>Telescope lsp_incoming_calls<cr>";
      key = "gai";
      mode = [ "n" ];
      options.desc = "C[a]lls Incoming";
    }
    {
      action = "<cmd>Telescope lsp_outgoing_calls<cr>";
      key = "gao";
      mode = [ "n" ];
      options.desc = "C[a]lls Outgoing";
    }
  ];
}
