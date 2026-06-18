_: {
  programs.nixvim.keymaps = [
    {
      key = "<leader><space>";
      options.desc = "Find Files (Root Dir)";
      action = "<cmd>lua require('snacks').picker.smart()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>,";
      options.desc = "Buffers";
      action = "<cmd>lua require('snacks').picker.buffers()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>.";
      options.desc = "Toggle Scratch Buffer";
      action = "<cmd>lua require('snacks').scratch()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>/";
      options.desc = "Grep (Root Dir)";
      action = "<cmd>lua require('snacks').picker.grep()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>:";
      options.desc = "Command History";
      action = "<cmd>lua require('snacks').picker.command_history()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>dps";
      options.desc = "Profiler Scratch Buffer";
      action = "<cmd>lua require('snacks').profiler.scratch()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>e";
      options.desc = "Explorer Snacks (root dir)";
      action = "<cmd>lua require('snacks').explorer()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>E";
      options.desc = "Explorer Snacks (cwd)";
      action = "<cmd>lua require('snacks').explorer({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fb";
      options.desc = "Buffers";
      action = "<cmd>lua require('snacks').picker.buffers()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fB";
      options.desc = "Buffers (all)";
      action = "<cmd>lua require('snacks').picker.buffers({ all = true })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fc";
      options.desc = "Find Config File";
      action = "<cmd>lua require('snacks').picker.files({ cwd = vim.fn.stdpath('config') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fe";
      options.desc = "Explorer Snacks (root dir)";
      action = "<cmd>lua require('snacks').explorer()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fE";
      options.desc = "Explorer Snacks (cwd)";
      action = "<cmd>lua require('snacks').explorer({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ff";
      options.desc = "Find Files (Root Dir)";
      action = "<cmd>lua require('snacks').picker.files()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fF";
      options.desc = "Find Files (cwd)";
      action = "<cmd>lua require('snacks').picker.files({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fg";
      options.desc = "Find Files (git-files)";
      action = "<cmd>lua require('snacks').picker.git_files()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fp";
      options.desc = "Projects";
      action = "<cmd>lua require('snacks').picker.projects()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fr";
      options.desc = "Recent";
      action = "<cmd>lua require('snacks').picker.recent()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fR";
      options.desc = "Recent (cwd)";
      action = "<cmd>lua require('snacks').picker.recent({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gd";
      options.desc = "Git Diff (hunks)";
      action = "<cmd>lua require('snacks').picker.git_diff()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gD";
      options.desc = "Git Diff (origin)";
      action = "<cmd>lua require('snacks').picker.git_diff({ origin = true })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gi";
      options.desc = "GitHub Issues (open)";
      action = "<cmd>lua require('snacks').picker.git_issues()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gI";
      options.desc = "GitHub Issues (all)";
      action = "<cmd>lua require('snacks').picker.git_issues({ all = true })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gp";
      options.desc = "GitHub Pull Requests (open)";
      action = "<cmd>lua require('snacks').picker.git_prs()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gP";
      options.desc = "GitHub Pull Requests (all)";
      action = "<cmd>lua require('snacks').picker.git_prs({ all = true })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gs";
      options.desc = "Git Status";
      action = "<cmd>lua require('snacks').picker.git_status()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gS";
      options.desc = "Git Stash";
      action = "<cmd>lua require('snacks').picker.git_stash()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>n";
      options.desc = "Notification History";
      action = "<cmd>lua require('snacks').notifier.show_history()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>S";
      options.desc = "Select Scratch Buffer";
      action = "<cmd>lua require('snacks').scratch.select()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>s\"";
      options.desc = "Registers";
      action = "<cmd>lua require('snacks').picker.registers()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>s/";
      options.desc = "Search History";
      action = "<cmd>lua require('snacks').picker.search_history()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sa";
      options.desc = "Autocmds";
      action = "<cmd>lua require('snacks').picker.autocmds()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sb";
      options.desc = "Buffer Lines";
      action = "<cmd>lua require('snacks').picker.lines()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sB";
      options.desc = "Grep Open Buffers";
      action = "<cmd>lua require('snacks').picker.grep_buffers()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sc";
      options.desc = "Command History";
      action = "<cmd>lua require('snacks').picker.command_history()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sC";
      options.desc = "Commands";
      action = "<cmd>lua require('snacks').picker.commands()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sd";
      options.desc = "Diagnostics";
      action = "<cmd>lua require('snacks').picker.diagnostics()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sD";
      options.desc = "Buffer Diagnostics";
      action = "<cmd>lua require('snacks').picker.diagnostics_buffer()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sg";
      options.desc = "Grep (Root Dir)";
      action = "<cmd>lua require('snacks').picker.grep()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sG";
      options.desc = "Grep (cwd)";
      action = "<cmd>lua require('snacks').picker.grep({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sh";
      options.desc = "Help Pages";
      action = "<cmd>lua require('snacks').picker.help()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sH";
      options.desc = "Highlights";
      action = "<cmd>lua require('snacks').picker.highlights()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>si";
      options.desc = "Icons";
      action = "<cmd>lua require('snacks').picker.icons()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sj";
      options.desc = "Jumps";
      action = "<cmd>lua require('snacks').picker.jumps()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sk";
      options.desc = "Keymaps";
      action = "<cmd>lua require('snacks').picker.keymaps()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sl";
      options.desc = "Location List";
      action = "<cmd>lua require('snacks').picker.loclist()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sm";
      options.desc = "Marks";
      action = "<cmd>lua require('snacks').picker.marks()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sM";
      options.desc = "Man Pages";
      action = "<cmd>lua require('snacks').picker.man()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sp";
      options.desc = "Search for Plugin Spec";
      action = "<cmd>lua require('snacks').picker.lazy()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sq";
      options.desc = "Quickfix List";
      action = "<cmd>lua require('snacks').picker.qflist()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sR";
      options.desc = "Resume";
      action = "<cmd>lua require('snacks').picker.resume()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>su";
      options.desc = "Undotree";
      action = "<cmd>lua require('snacks').picker.undo()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sw";
      options.desc = "Visual selection or word (Root Dir)";
      action = "<cmd>lua require('snacks').picker.grep_word()<cr>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<leader>sW";
      options.desc = "Visual selection or word (cwd)";
      action = "<cmd>lua require('snacks').picker.grep_word({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<leader>uC";
      options.desc = "Colorschemes";
      action = "<cmd>lua require('snacks').picker.colorschemes()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>un";
      options.desc = "Dismiss All Notifications";
      action = "<cmd>lua require('snacks').notifier.hide()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>e";
      options.desc = "Explorer Snacks (root dir)";
      action = "<cmd>lua require('snacks').explorer()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>E";
      options.desc = "Explorer Snacks (cwd)";
      action = "<cmd>lua require('snacks').explorer({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fe";
      options.desc = "Explorer Snacks (root dir)";
      action = "<cmd>lua require('snacks').explorer()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fE";
      options.desc = "Explorer Snacks (cwd)";
      action = "<cmd>lua require('snacks').explorer({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader><space>";
      options.desc = "Find Files (Root Dir)";
      action = "<cmd>lua require('snacks').picker.smart()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>,";
      options.desc = "Buffers";
      action = "<cmd>lua require('snacks').picker.buffers()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>/";
      options.desc = "Grep (Root Dir)";
      action = "<cmd>lua require('snacks').picker.grep()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>:";
      options.desc = "Command History";
      action = "<cmd>lua require('snacks').picker.command_history()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fb";
      options.desc = "Buffers";
      action = "<cmd>lua require('snacks').picker.buffers()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fB";
      options.desc = "Buffers (all)";
      action = "<cmd>lua require('snacks').picker.buffers({ all = true })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fc";
      options.desc = "Find Config File";
      action = "<cmd>lua require('snacks').picker.files({ cwd = vim.fn.stdpath('config') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>ff";
      options.desc = "Find Files (Root Dir)";
      action = "<cmd>lua require('snacks').picker.files()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fF";
      options.desc = "Find Files (cwd)";
      action = "<cmd>lua require('snacks').picker.files({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fg";
      options.desc = "Find Files (git-files)";
      action = "<cmd>lua require('snacks').picker.git_files()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fp";
      options.desc = "Projects";
      action = "<cmd>lua require('snacks').picker.projects()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fr";
      options.desc = "Recent";
      action = "<cmd>lua require('snacks').picker.recent()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>fR";
      options.desc = "Recent (cwd)";
      action = "<cmd>lua require('snacks').picker.recent({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gd";
      options.desc = "Git Diff (hunks)";
      action = "<cmd>lua require('snacks').picker.git_diff()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gD";
      options.desc = "Git Diff (origin)";
      action = "<cmd>lua require('snacks').picker.git_diff({ origin = true })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gi";
      options.desc = "GitHub Issues (open)";
      action = "<cmd>lua require('snacks').picker.git_issues()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gI";
      options.desc = "GitHub Issues (all)";
      action = "<cmd>lua require('snacks').picker.git_issues({ all = true })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gp";
      options.desc = "GitHub Pull Requests (open)";
      action = "<cmd>lua require('snacks').picker.git_prs()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gP";
      options.desc = "GitHub Pull Requests (all)";
      action = "<cmd>lua require('snacks').picker.git_prs({ all = true })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gs";
      options.desc = "Git Status";
      action = "<cmd>lua require('snacks').picker.git_status()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>gS";
      options.desc = "Git Stash";
      action = "<cmd>lua require('snacks').picker.git_stash()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>n";
      options.desc = "Notification History";
      action = "<cmd>lua require('snacks').notifier.show_history()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>s\"";
      options.desc = "Registers";
      action = "<cmd>lua require('snacks').picker.registers()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>s/";
      options.desc = "Search History";
      action = "<cmd>lua require('snacks').picker.search_history()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sa";
      options.desc = "Autocmds";
      action = "<cmd>lua require('snacks').picker.autocmds()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sb";
      options.desc = "Buffer Lines";
      action = "<cmd>lua require('snacks').picker.lines()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sB";
      options.desc = "Grep Open Buffers";
      action = "<cmd>lua require('snacks').picker.grep_buffers()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sc";
      options.desc = "Command History";
      action = "<cmd>lua require('snacks').picker.command_history()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sC";
      options.desc = "Commands";
      action = "<cmd>lua require('snacks').picker.commands()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sd";
      options.desc = "Diagnostics";
      action = "<cmd>lua require('snacks').picker.diagnostics()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sD";
      options.desc = "Buffer Diagnostics";
      action = "<cmd>lua require('snacks').picker.diagnostics_buffer()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sg";
      options.desc = "Grep (Root Dir)";
      action = "<cmd>lua require('snacks').picker.grep()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sG";
      options.desc = "Grep (cwd)";
      action = "<cmd>lua require('snacks').picker.grep({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sh";
      options.desc = "Help Pages";
      action = "<cmd>lua require('snacks').picker.help()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sH";
      options.desc = "Highlights";
      action = "<cmd>lua require('snacks').picker.highlights()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>si";
      options.desc = "Icons";
      action = "<cmd>lua require('snacks').picker.icons()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sj";
      options.desc = "Jumps";
      action = "<cmd>lua require('snacks').picker.jumps()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sk";
      options.desc = "Keymaps";
      action = "<cmd>lua require('snacks').picker.keymaps()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sl";
      options.desc = "Location List";
      action = "<cmd>lua require('snacks').picker.loclist()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sm";
      options.desc = "Marks";
      action = "<cmd>lua require('snacks').picker.marks()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sM";
      options.desc = "Man Pages";
      action = "<cmd>lua require('snacks').picker.man()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sp";
      options.desc = "Search for Plugin Spec";
      action = "<cmd>lua require('snacks').picker.lazy()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sq";
      options.desc = "Quickfix List";
      action = "<cmd>lua require('snacks').picker.qflist()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sR";
      options.desc = "Resume";
      action = "<cmd>lua require('snacks').picker.resume()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>su";
      options.desc = "Undotree";
      action = "<cmd>lua require('snacks').picker.undo()<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>sw";
      options.desc = "Visual selection or word (Root Dir)";
      action = "<cmd>lua require('snacks').picker.grep_word()<cr>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<leader>sW";
      options.desc = "Visual selection or word (cwd)";
      action = "<cmd>lua require('snacks').picker.grep_word({ cwd = vim.fn.expand('%:p:h') })<cr>";
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "<leader>uC";
      options.desc = "Colorschemes";
      action = "<cmd>lua require('snacks').picker.colorschemes()<cr>";
      mode = [ "n" ];
    }
  ];
}
