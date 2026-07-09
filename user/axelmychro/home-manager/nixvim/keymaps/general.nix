_: {
  programs.nixvim.keymaps = [
    {
      key = "j";
      options.desc = "Down";
      action = "j";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<Down>";
      options.desc = "Down";
      action = "<Down>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "k";
      options.desc = "Up";
      action = "k";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<Up>";
      options.desc = "Up";
      action = "<Up>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<C-h>";
      options.desc = "Go to Left Window";
      action = "<C-w>h";
      mode = [ "n" ];
    }
    {
      key = "<C-j>";
      options.desc = "Go to Lower Window";
      action = "<C-w>j";
      mode = [ "n" ];
    }
    {
      key = "<C-k>";
      options.desc = "Go to Upper Window";
      action = "<C-w>k";
      mode = [ "n" ];
    }
    {
      key = "<C-l>";
      options.desc = "Go to Right Window";
      action = "<C-w>l";
      mode = [ "n" ];
    }
    {
      key = "<C-Up>";
      options.desc = "Increase Window Height";
      action = "<cmd>resize +2<cr>";
      mode = [ "n" ];
    }
    {
      key = "<C-Down>";
      options.desc = "Decrease Window Height";
      action = "<cmd>resize -2<cr>";
      mode = [ "n" ];
    }
    {
      key = "<C-Left>";
      options.desc = "Decrease Window Width";
      action = "<cmd>vertical resize -2<cr>";
      mode = [ "n" ];
    }
    {
      key = "<C-Right>";
      options.desc = "Increase Window Width";
      action = "<cmd>vertical resize +2<cr>";
      mode = [ "n" ];
    }
    {
      key = "<A-j>";
      options.desc = "Move Down";
      action = "<cmd>m .+1<cr>==";
      mode = [
        "n"
        "i"
        "v"
      ];
    }
    {
      key = "<A-k>";
      options.desc = "Move Up";
      action = "<cmd>m .-2<cr>==";
      mode = [
        "n"
        "i"
        "v"
      ];
    }
    {
      key = "<S-h>";
      options.desc = "Prev Buffer";
      action = "<cmd>bprevious<cr>";
      mode = [ "n" ];
    }
    {
      key = "<S-l>";
      options.desc = "Next Buffer";
      action = "<cmd>bnext<cr>";
      mode = [ "n" ];
    }
    {
      key = "[b";
      options.desc = "Prev Buffer";
      action = "<cmd>bprevious<cr>";
      mode = [ "n" ];
    }
    {
      key = "]b";
      options.desc = "Next Buffer";
      action = "<cmd>bnext<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>bb";
      options.desc = "Switch to Other Buffer";
      action = "<cmd>e #<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>`";
      options.desc = "Switch to Other Buffer";
      action = "<cmd>e #<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>bd";
      options.desc = "Delete Buffer";
      action = "<cmd>bd<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>bo";
      options.desc = "Delete Other Buffers";
      action = "<cmd>%bd|e#|bd#<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>bi";
      options.desc = "Delete Invisible Buffers";
      action = "<cmd>bd<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>bD";
      options.desc = "Delete Buffer and Window";
      action = "<cmd>bd!<cr>";
      mode = [ "n" ];
    }
    {
      key = "<esc>";
      options.desc = "Escape and Clear hlsearch";
      action = "<cmd>nohlsearch<cr><esc>";
      mode = [
        "i"
        "n"
        "s"
      ];
    }
    {
      key = "<leader>ur";
      options.desc = "Redraw / Clear hlsearch / Diff Update";
      action = "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><cr>";
      mode = [ "n" ];
    }
    {
      key = "n";
      options.desc = "Next Search Result";
      action = "n";
      mode = [
        "n"
        "x"
        "o"
      ];
    }
    {
      key = "N";
      options.desc = "Prev Search Result";
      action = "N";
      mode = [
        "n"
        "x"
        "o"
      ];
    }
    {
      key = "<C-s>";
      options.desc = "Save File";
      action = "<cmd>w<cr><esc>";
      mode = [
        "i"
        "x"
        "n"
        "s"
      ];
    }
    {
      key = "<leader>K";
      options.desc = "Keywordprg";
      action = "<cmd>norm! K<cr>";
      mode = [ "n" ];
    }
    {
      key = "gco";
      options.desc = "Add Comment Below";
      action = "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      mode = [ "n" ];
    }
    {
      key = "gcO";
      options.desc = "Add Comment Above";
      action = "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      mode = [ "n" ];
    }
    {
      key = "<leader>l";
      options.desc = "Lazy";
      action = "<cmd>Lazy<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fn";
      options.desc = "New File";
      action = "<cmd>enew<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>xl";
      options.desc = "Location List";
      action = "<cmd>lopen<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>xq";
      options.desc = "Quickfix List";
      action = "<cmd>copen<cr>";
      mode = [ "n" ];
    }
    {
      key = "[q";
      options.desc = "Previous Quickfix";
      action = "<cmd>cprev<cr>";
      mode = [ "n" ];
    }
    {
      key = "]q";
      options.desc = "Next Quickfix";
      action = "<cmd>cnext<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>cf";
      options.desc = "Format";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<leader>cd";
      options.desc = "Line Diagnostics";
      action = "<cmd>lua vim.diagnostic.open_float()<cr>";
      mode = [ "n" ];
    }
    {
      key = "]d";
      options.desc = "Next Diagnostic";
      action = "<cmd>lua vim.diagnostic.goto_next()<cr>";
      mode = [ "n" ];
    }
    {
      key = "[d";
      options.desc = "Prev Diagnostic";
      action = "<cmd>lua vim.diagnostic.goto_prev()<cr>";
      mode = [ "n" ];
    }
    {
      key = "]e";
      options.desc = "Next Error";
      action = "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>";
      mode = [ "n" ];
    }
    {
      key = "[e";
      options.desc = "Prev Error";
      action = "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>";
      mode = [ "n" ];
    }
    {
      key = "]w";
      options.desc = "Next Warning";
      action = "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<cr>";
      mode = [ "n" ];
    }
    {
      key = "[w";
      options.desc = "Prev Warning";
      action = "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uf";
      options.desc = "Toggle Auto Format (Global)";
      action = "<cmd>lua require('lazyvim.plugins.lsp.format').toggle()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uF";
      options.desc = "Toggle Auto Format (Buffer)";
      action = "<cmd>lua require('lazyvim.plugins.lsp.format').toggle(true)<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>us";
      options.desc = "Toggle Spelling";
      action = "<cmd>set spell!<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uw";
      options.desc = "Toggle Wrap";
      action = "<cmd>set wrap!<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uL";
      options.desc = "Toggle Relative Number";
      action = "<cmd>set relativenumber!<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ud";
      options.desc = "Toggle Diagnostics";
      action = "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ul";
      options.desc = "Toggle Line Numbers";
      action = "<cmd>set number!<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uc";
      options.desc = "Toggle Conceal Level";
      action = "<cmd>set conceallevel=3<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uA";
      options.desc = "Toggle Tabline";
      action = "<cmd>set tabline=<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uT";
      options.desc = "Toggle Treesitter Highlight";
      action = "<cmd>TSBufToggle highlight<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ub";
      options.desc = "Toggle Dark Background";
      action = "<cmd>set background=dark<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uD";
      options.desc = "Toggle Dimming";
      action = "<cmd>lua require('snacks').toggle.dim()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ua";
      options.desc = "Toggle Animations";
      action = "<cmd>lua require('snacks').toggle.animate()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ug";
      options.desc = "Toggle Indent Guides";
      action = "<cmd>lua require('snacks').toggle.indent()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uS";
      options.desc = "Toggle Smooth Scroll";
      action = "<cmd>lua require('snacks').toggle.scroll()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>dpp";
      options.desc = "Toggle Profiler";
      action = "<cmd>lua require('snacks').profiler.toggle()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>dph";
      options.desc = "Toggle Profiler Highlights";
      action = "<cmd>lua require('snacks').profiler.highlight()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uh";
      options.desc = "Toggle Inlay Hints";
      action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gL";
      options.desc = "Git Log (cwd)";
      action = "<cmd>lua require('snacks').git.log()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gb";
      options.desc = "Git Blame Line";
      action = "<cmd>lua require('snacks').git.blame_line()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gf";
      options.desc = "Git Current File History";
      action = "<cmd>lua require('snacks').git.log_file()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gl";
      options.desc = "Git Log";
      action = "<cmd>lua require('snacks').git.log()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gB";
      options.desc = "Git Browse (open)";
      action = "<cmd>lua require('snacks').gitbrowse()<cr>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<leader>gY";
      options.desc = "Git Browse (copy)";
      action = "<cmd>lua require('snacks').gitbrowse({ clipboard = true })<cr>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<leader>qq";
      options.desc = "Quit All";
      action = "<cmd>qa<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ui";
      options.desc = "Inspect Pos";
      action = "<cmd>Inspect<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uI";
      options.desc = "Inspect Tree";
      action = "<cmd>InspectTree<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>L";
      options.desc = "LazyVim Changelog";
      action = "<cmd>Lazy<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fT";
      options.desc = "Terminal (cwd)";
      action = "<cmd>terminal<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ft";
      options.desc = "Terminal (Root Dir)";
      action = "<cmd>terminal<cr>";
      mode = [ "n" ];
    }
    {
      key = "<c-/>";
      options.desc = "Terminal (Root Dir)";
      action = "<cmd>terminal<cr>";
      mode = [
        "n"
        "t"
      ];
    }
    {
      key = "<c-_>";
      options.desc = "which_key_ignore";
      action = "<cmd>terminal<cr>";
      mode = [
        "n"
        "t"
      ];
    }
    {
      key = "<leader>-";
      options.desc = "Split Window Below";
      action = "<C-w>s";
      mode = [ "n" ];
    }
    {
      key = "<leader>|";
      options.desc = "Split Window Right";
      action = "<C-w>v";
      mode = [ "n" ];
    }
    {
      key = "<leader>wd";
      options.desc = "Delete Window";
      action = "<C-w>c";
      mode = [ "n" ];
    }
    {
      key = "<leader>wm";
      options.desc = "Toggle Zoom Mode";
      action = "<C-w>|<C-w>_";
      mode = [ "n" ];
    }
    {
      key = "<leader>uZ";
      options.desc = "Toggle Zoom Mode";
      action = "<cmd>lua require('snacks').toggle.zoom()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>uz";
      options.desc = "Toggle Zen Mode";
      action = "<cmd>lua require('snacks').toggle.zen()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader><tab>l";
      options.desc = "Last Tab";
      action = "<cmd>tablast<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader><tab>o";
      options.desc = "Close Other Tabs";
      action = "<cmd>tabonly<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader><tab>f";
      options.desc = "First Tab";
      action = "<cmd>tabfirst<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader><tab><tab>";
      options.desc = "New Tab";
      action = "<cmd>tabnew<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader><tab>]";
      options.desc = "Next Tab";
      action = "<cmd>tabnext<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader><tab>d";
      options.desc = "Close Tab";
      action = "<cmd>tabclose<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader><tab>[";
      options.desc = "Previous Tab";
      action = "<cmd>tabprevious<cr>";
      mode = [ "n" ];
    }
  ];
}
