{
  programs.nixvim.keymaps = [
    # split go-to
    {
      action = "<c-w>h";
      key = "<c-h>";
      mode = [ "n" ];
      options.desc = "Go to Left Window";
    }
    {
      action = "<c-w>j";
      key = "<c-j>";
      mode = [ "n" ];
      options.desc = "Go to Lower Window";
    }
    {
      action = "<c-w>k";
      key = "<c-k>";
      mode = [ "n" ];
      options.desc = "Go to Upper Window";
    }
    {
      action = "<c-w>l";
      key = "<c-l>";
      mode = [ "n" ];
      options.desc = "Go to Right Window";
    }
    # split resize
    {
      action = "<cmd>resize +2<cr>";
      key = "<c-Up>";
      mode = [ "n" ];
      options.desc = "Increase Window Height";
    }
    {
      action = "<cmd>resize -2<cr>";
      key = "<c-Down>";
      mode = [ "n" ];
      options.desc = "Decrease Window Height";
    }
    {
      action = "<cmd>vertical resize +2<cr>";
      key = "<c-Right>";
      mode = [ "n" ];
      options.desc = "Increase Window Width";
    }
    {
      action = "<cmd>vertical resize -2<cr>";
      key = "<c-Left>";
      mode = [ "n" ];
      options.desc = "Decrease Window Width";
    }
    {
      action = "<cmd>bprevious<cr>";
      key = "<S-h>";
      mode = [ "n" ];
      options.desc = "Prev Buffer";
    }
    {
      action = "<cmd>bnext<cr>";
      key = "<S-l>";
      mode = [ "n" ];
      options.desc = "Next Buffer";
    }
    {
      action = "<cmd>bprevious<cr>";
      key = "[b";
      mode = [ "n" ];
      options.desc = "Prev Buffer";
    }
    {
      action = "<cmd>bnext<cr>";
      key = "]b";
      mode = [ "n" ];
      options.desc = "Next Buffer";
    }
    {
      action = "<cmd>e #<cr>";
      key = "<leader>bb";
      mode = [ "n" ];
      options.desc = "Switch to Other Buffer";
    }
    {
      action = "<cmd>e #<cr>";
      key = "<leader>`";
      mode = [ "n" ];
      options.desc = "Switch to Other Buffer";
    }
    {
      action = "<cmd>bd<cr>";
      key = "<leader>bd";
      mode = [ "n" ];
      options.desc = "Delete Buffer";
    }
    {
      action = "<cmd>%bd|e#|bd#<cr>";
      key = "<leader>bo";
      mode = [ "n" ];
      options.desc = "Delete Other Buffers";
    }
    {
      action = "<cmd>bd<cr>";
      key = "<leader>bi";
      mode = [ "n" ];
      options.desc = "Delete Invisible Buffers";
    }
    {
      action = "<cmd>bd!<cr>";
      key = "<leader>bD";
      mode = [ "n" ];
      options.desc = "Delete Buffer and Window";
    }
    {
      action = "<cmd>nohlsearch<cr><esc>";
      key = "<esc>";
      mode = [
        "i"
        "n"
        "s"
      ];
      options.desc = "Escape and Clear hlsearch";
    }
    {
      action = "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <c-L><cr>";
      key = "<leader>ur";
      mode = [ "n" ];
      options.desc = "Redraw / Clear hlsearch / Diff Update";
    }
    {
      action = "n";
      key = "n";
      mode = [
        "n"
        "x"
        "o"
      ];
      options.desc = "Next Search Result";
    }
    {
      action = "N";
      key = "N";
      mode = [
        "n"
        "x"
        "o"
      ];
      options.desc = "Prev Search Result";
    }
    {
      action = "<cmd>w<cr><esc>";
      key = "<c-s>";
      mode = [
        "i"
        "x"
        "n"
        "s"
      ];
      options.desc = "Save File";
    }
    {
      action = "<cmd>enew<cr>";
      key = "<leader>fn";
      mode = [ "n" ];
      options.desc = "New File";
    }
    {
      action = "<cmd>copen<cr>";
      key = "<leader>xq";
      mode = [ "n" ];
      options.desc = "Quickfix List";
    }
    {
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      key = "<leader>cf";
      mode = [
        "n"
        "x"
      ];
      options.desc = "Format";
    }
    {
      action = "<cmd>lua vim.diagnostic.open_float()<cr>";
      key = "<leader>cd";
      mode = [ "n" ];
      options.desc = "Line Diagnostics";
    }
    {
      action = "<cmd>lua vim.diagnostic.goto_next()<cr>";
      key = "]d";
      mode = [ "n" ];
      options.desc = "Next Diagnostic";
    }
    {
      action = "<cmd>lua vim.diagnostic.goto_prev()<cr>";
      key = "[d";
      mode = [ "n" ];
      options.desc = "Prev Diagnostic";
    }
    {
      action = "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>";
      key = "]e";
      mode = [ "n" ];
      options.desc = "Next Error";
    }
    {
      action = "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>";
      key = "[e";
      mode = [ "n" ];
      options.desc = "Prev Error";
    }
    {
      action = "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<cr>";
      key = "]w";
      mode = [ "n" ];
      options.desc = "Next Warning";
    }
    {
      action = "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<cr>";
      key = "[w";
      mode = [ "n" ];
      options.desc = "Prev Warning";
    }
    {
      action = "<cmd>set spell!<cr>";
      key = "<leader>us";
      mode = [ "n" ];
      options.desc = "Toggle Spelling";
    }
    {
      action = "<cmd>set wrap!<cr>";
      key = "<leader>uw";
      mode = [ "n" ];
      options.desc = "Toggle Wrap";
    }
    {
      action = "<cmd>set relativenumber!<cr>";
      key = "<leader>uL";
      mode = [ "n" ];
      options.desc = "Toggle Relative Number";
    }
    {
      action = "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>";
      key = "<leader>ud";
      mode = [ "n" ];
      options.desc = "Toggle Diagnostics";
    }
    {
      action = "<cmd>set number!<cr>";
      key = "<leader>ul";
      mode = [ "n" ];
      options.desc = "Toggle Line Numbers";
    }
    {
      action = "<cmd>set conceallevel=3<cr>";
      key = "<leader>uc";
      mode = [ "n" ];
      options.desc = "Toggle Conceal Level";
    }
    {
      action = "<cmd>set tabline=<cr>";
      key = "<leader>uA";
      mode = [ "n" ];
      options.desc = "Toggle Tabline";
    }
    {
      action = "<cmd>set background=dark<cr>";
      key = "<leader>ub";
      mode = [ "n" ];
      options.desc = "Toggle Dark Background";
    }
    {
      action = "<cmd>lua require('snacks').toggle.dim()<cr>";
      key = "<leader>uD";
      mode = [ "n" ];
      options.desc = "Toggle Dimming";
    }
    {
      action = "<cmd>lua require('snacks').toggle.animate()<cr>";
      key = "<leader>ua";
      mode = [ "n" ];
      options.desc = "Toggle Animations";
    }
    {
      action = "<cmd>lua require('snacks').toggle.indent()<cr>";
      key = "<leader>ug";
      mode = [ "n" ];
      options.desc = "Toggle Indent Guides";
    }
    {
      action = "<cmd>lua require('snacks').toggle.scroll()<cr>";
      key = "<leader>uS";
      mode = [ "n" ];
      options.desc = "Toggle Smooth Scroll";
    }
    {
      action = "<cmd>lua require('snacks').profiler.toggle()<cr>";
      key = "<leader>dpp";
      mode = [ "n" ];
      options.desc = "Toggle Profiler";
    }
    {
      action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>";
      key = "<leader>uh";
      mode = [ "n" ];
      options.desc = "Toggle Inlay Hints";
    }
    {
      action = "<cmd>lua require('snacks').git.log()<cr>";
      key = "<leader>gL";
      mode = [ "n" ];
      options.desc = "Git Log (cwd)";
    }
    {
      action = "<cmd>lua require('snacks').git.blame_line()<cr>";
      key = "<leader>gb";
      mode = [ "n" ];
      options.desc = "Git Blame Line";
    }
    {
      action = "<cmd>lua require('snacks').git.log_file()<cr>";
      key = "<leader>gf";
      mode = [ "n" ];
      options.desc = "Git Current File History";
    }
    {
      action = "<cmd>lua require('snacks').git.log()<cr>";
      key = "<leader>gl";
      mode = [ "n" ];
      options.desc = "Git Log";
    }
    {
      action = "<cmd>lua require('snacks').gitbrowse()<cr>";
      key = "<leader>gB";
      mode = [
        "n"
        "x"
      ];
      options.desc = "Git Browse (open)";
    }
    {
      action = "<cmd>lua require('snacks').gitbrowse({ clipboard = true })<cr>";
      key = "<leader>gY";
      mode = [
        "n"
        "x"
      ];
      options.desc = "Git Browse (copy)";
    }
    {
      action = "<cmd>qa<cr>";
      key = "<leader>qq";
      mode = [ "n" ];
      options.desc = "Quit All";
    }
    {
      action = "<cmd>Inspect<cr>";
      key = "<leader>ui";
      mode = [ "n" ];
      options.desc = "Inspect Pos";
    }
    {
      action = "<cmd>InspectTree<cr>";
      key = "<leader>uI";
      mode = [ "n" ];
      options.desc = "Inspect Tree";
    }
    {
      action = "<cmd>Lazy<cr>";
      key = "<leader>L";
      mode = [ "n" ];
      options.desc = "LazyVim Changelog";
    }
    {
      action = "<c-w>s";
      key = "<leader>-";
      mode = [ "n" ];
      options.desc = "Split Window Below";
    }
    {
      action = "<c-w>v";
      key = "<leader>|";
      mode = [ "n" ];
      options.desc = "Split Window Right";
    }
    {
      action = "<c-w>c";
      key = "<leader>wd";
      mode = [ "n" ];
      options.desc = "Delete Window";
    }
    {
      action = "<c-w>|<c-w>_";
      key = "<leader>wm";
      mode = [ "n" ];
      options.desc = "Toggle Zoom Mode";
    }
    {
      action = "<cmd>lua require('snacks').toggle.zoom()<cr>";
      key = "<leader>uZ";
      mode = [ "n" ];
      options.desc = "Toggle Zoom Mode";
    }
    {
      action = "<cmd>lua require('snacks').toggle.zen()<cr>";
      key = "<leader>uz";
      mode = [ "n" ];
      options.desc = "Toggle Zen Mode";
    }
    {
      action = "<cmd>tablast<cr>";
      key = "<leader><tab>l";
      mode = [ "n" ];
      options.desc = "Last Tab";
    }
    {
      action = "<cmd>tabonly<cr>";
      key = "<leader><tab>o";
      mode = [ "n" ];
      options.desc = "Close Other Tabs";
    }
    {
      action = "<cmd>tabfirst<cr>";
      key = "<leader><tab>f";
      mode = [ "n" ];
      options.desc = "First Tab";
    }
    {
      action = "<cmd>tabnew<cr>";
      key = "<leader><tab><tab>";
      mode = [ "n" ];
      options.desc = "New Tab";
    }
    {
      action = "<cmd>tabnext<cr>";
      key = "<leader><tab>]";
      mode = [ "n" ];
      options.desc = "next tab";
    }
    {
      action = "<cmd>tabclose<cr>";
      key = "<leader><tab>d";
      mode = [ "n" ];
      options.desc = "close tab";
    }
    {
      action = "<cmd>tabprevious<cr>";
      key = "<leader><tab>[";
      mode = [ "n" ];
      options.desc = "previous tab";
    }
  ];
}
