_: {
  programs.nixvim.keymaps = [
    {
      key = "<leader>cl";
      options.desc = "Lsp Info";
      action = "<cmd>LspInfo<cr>";
      mode = [ "n" ];
    }
    {
      key = "gd";
      options.desc = "Goto Definition";
      action = "<cmd>Telescope lsp_definitions<cr>";
      mode = [
        "n"
        "n"
      ];
    }
    {
      key = "gr";
      options.desc = "References";
      action = "<cmd>Telescope lsp_references<cr>";
      mode = [
        "n"
        "n"
      ];
    }
    {
      key = "gI";
      options.desc = "Goto Implementation";
      action = "<cmd>Telescope lsp_implementations<cr>";
      mode = [
        "n"
        "n"
      ];
    }
    {
      key = "gy";
      options.desc = "Goto T[y]pe Definition";
      action = "<cmd>Telescope lsp_type_definitions<cr>";
      mode = [
        "n"
        "n"
      ];
    }
    {
      key = "gD";
      options.desc = "Goto Declaration";
      action = "<cmd>lua vim.lsp.buf.declaration()<cr>";
      mode = [ "n" ];
    }
    {
      key = "K";
      options.desc = "Hover";
      action = "<cmd>lua vim.lsp.buf.hover()<cr>";
      mode = [ "n" ];
    }
    {
      key = "gK";
      options.desc = "Signature Help";
      action = "<cmd>lua vim.lsp.buf.signature_help()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<c-k>";
      options.desc = "Signature Help";
      action = "<cmd>lua vim.lsp.buf.signature_help()<cr>";
      mode = [ "i" ];
    }
    {
      key = "<leader>ca";
      options.desc = "Code Action";
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<leader>cc";
      options.desc = "Run Codelens";
      action = "<cmd>lua vim.lsp.codelens.run()<cr>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<leader>cC";
      options.desc = "Refresh & Display Codelens";
      action = "<cmd>lua vim.lsp.codelens.refresh()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>cR";
      options.desc = "Rename File";
      action = "<cmd>lua require('snacks').rename.rename_file()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>cr";
      options.desc = "Rename";
      action = "<cmd>lua vim.lsp.buf.rename()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>cA";
      options.desc = "Source Action";
      action = "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source' } } })<cr>";
      mode = [ "n" ];
    }
    {
      key = "]]";
      options.desc = "Next Reference";
      action = "<cmd>lua require('illuminate').goto_next_reference()<cr>";
      mode = [ "n" ];
    }
    {
      key = "[[";
      options.desc = "Prev Reference";
      action = "<cmd>lua require('illuminate').goto_prev_reference()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<a-n>";
      options.desc = "Next Reference";
      action = "<cmd>lua require('illuminate').goto_next_reference()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<a-p>";
      options.desc = "Prev Reference";
      action = "<cmd>lua require('illuminate').goto_prev_reference()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>co";
      options.desc = "Organize Imports";
      action = "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } } })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ss";
      options.desc = "LSP Symbols";
      action = "<cmd>Telescope lsp_document_symbols<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sS";
      options.desc = "LSP Workspace Symbols";
      action = "<cmd>Telescope lsp_workspace_symbols<cr>";
      mode = [ "n" ];
    }
    {
      key = "gai";
      options.desc = "C[a]lls Incoming";
      action = "<cmd>Telescope lsp_incoming_calls<cr>";
      mode = [ "n" ];
    }
    {
      key = "gao";
      options.desc = "C[a]lls Outgoing";
      action = "<cmd>Telescope lsp_outgoing_calls<cr>";
      mode = [ "n" ];
    }
  ];
}
