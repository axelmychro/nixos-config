{
  programs.nixvim = {
    plugins.snacks.enable = true;
    keymaps = [
      {
        action = "<cmd>lua require('snacks').picker.smart()<cr>";
        key = "<leader><space>";
        mode = [ "n" ];
        options.desc = "Find Files (Root Dir)";
      }
      {
        action = "<cmd>lua require('snacks').picker.buffers()<cr>";
        key = "<leader>,";
        mode = [ "n" ];
        options.desc = "Buffers";
      }
      {
        action = "<cmd>lua require('snacks').scratch()<cr>";
        key = "<leader>.";
        mode = [ "n" ];
        options.desc = "Toggle Scratch Buffer";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep()<cr>";
        key = "<leader>/";
        mode = [ "n" ];
        options.desc = "Grep (Root Dir)";
      }
      {
        action = "<cmd>lua require('snacks').picker.command_history()<cr>";
        key = "<leader>:";
        mode = [ "n" ];
        options.desc = "Command History";
      }
      {
        action = "<cmd>lua require('snacks').profiler.scratch()<cr>";
        key = "<leader>dps";
        mode = [ "n" ];
        options.desc = "Profiler Scratch Buffer";
      }
      {
        action = "<cmd>lua require('snacks').explorer()<cr>";
        key = "<leader>e";
        mode = [ "n" ];
        options.desc = "Explorer Snacks";
      }
      {
        action = "<cmd>lua require('snacks').picker.buffers()<cr>";
        key = "<leader>fb";
        mode = [ "n" ];
        options.desc = "Buffers";
      }
      {
        action = "<cmd>lua require('snacks').picker.buffers({ all = true })<cr>";
        key = "<leader>fB";
        mode = [ "n" ];
        options.desc = "Buffers (all)";
      }
      {
        action = "<cmd>lua require('snacks').picker.files({ cwd = vim.fn.stdpath('config') })<cr>";
        key = "<leader>fc";
        mode = [ "n" ];
        options.desc = "Find Config File";
      }
      {
        action = "<cmd>lua require('snacks').explorer()<cr>";
        key = "<leader>fe";
        mode = [ "n" ];
        options.desc = "Explorer Snacks (root dir)";
      }
      {
        action = "<cmd>lua require('snacks').explorer({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>fE";
        mode = [ "n" ];
        options.desc = "Explorer Snacks (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').picker.files()<cr>";
        key = "<leader>ff";
        mode = [ "n" ];
        options.desc = "Find Files (Root Dir)";
      }
      {
        action = "<cmd>lua require('snacks').picker.files({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>fF";
        mode = [ "n" ];
        options.desc = "Find Files (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_files()<cr>";
        key = "<leader>fg";
        mode = [ "n" ];
        options.desc = "Find Files (git-files)";
      }
      {
        action = "<cmd>lua require('snacks').picker.projects()<cr>";
        key = "<leader>fp";
        mode = [ "n" ];
        options.desc = "Projects";
      }
      {
        action = "<cmd>lua require('snacks').picker.recent()<cr>";
        key = "<leader>fr";
        mode = [ "n" ];
        options.desc = "Recent";
      }
      {
        action = "<cmd>lua require('snacks').picker.recent({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>fR";
        mode = [ "n" ];
        options.desc = "Recent (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_diff()<cr>";
        key = "<leader>gd";
        mode = [ "n" ];
        options.desc = "Git Diff (hunks)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_diff({ origin = true })<cr>";
        key = "<leader>gD";
        mode = [ "n" ];
        options.desc = "Git Diff (origin)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_issues()<cr>";
        key = "<leader>gi";
        mode = [ "n" ];
        options.desc = "GitHub Issues (open)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_issues({ all = true })<cr>";
        key = "<leader>gI";
        mode = [ "n" ];
        options.desc = "GitHub Issues (all)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_prs()<cr>";
        key = "<leader>gp";
        mode = [ "n" ];
        options.desc = "GitHub Pull Requests (open)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_prs({ all = true })<cr>";
        key = "<leader>gP";
        mode = [ "n" ];
        options.desc = "GitHub Pull Requests (all)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_status()<cr>";
        key = "<leader>gs";
        mode = [ "n" ];
        options.desc = "Git Status";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_stash()<cr>";
        key = "<leader>gS";
        mode = [ "n" ];
        options.desc = "Git Stash";
      }
      {
        action = "<cmd>lua require('snacks').notifier.show_history()<cr>";
        key = "<leader>n";
        mode = [ "n" ];
        options.desc = "Notification History";
      }
      {
        action = "<cmd>lua require('snacks').scratch.select()<cr>";
        key = "<leader>S";
        mode = [ "n" ];
        options.desc = "Select Scratch Buffer";
      }
      {
        action = "<cmd>lua require('snacks').picker.registers()<cr>";
        key = "<leader>s\"";
        mode = [ "n" ];
        options.desc = "Registers";
      }
      {
        action = "<cmd>lua require('snacks').picker.search_history()<cr>";
        key = "<leader>s/";
        mode = [ "n" ];
        options.desc = "Search History";
      }
      {
        action = "<cmd>lua require('snacks').picker.autocmds()<cr>";
        key = "<leader>sa";
        mode = [ "n" ];
        options.desc = "Autocmds";
      }
      {
        action = "<cmd>lua require('snacks').picker.lines()<cr>";
        key = "<leader>sb";
        mode = [ "n" ];
        options.desc = "Buffer Lines";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep_buffers()<cr>";
        key = "<leader>sB";
        mode = [ "n" ];
        options.desc = "Grep Open Buffers";
      }
      {
        action = "<cmd>lua require('snacks').picker.command_history()<cr>";
        key = "<leader>sc";
        mode = [ "n" ];
        options.desc = "Command History";
      }
      {
        action = "<cmd>lua require('snacks').picker.commands()<cr>";
        key = "<leader>sC";
        mode = [ "n" ];
        options.desc = "Commands";
      }
      {
        action = "<cmd>lua require('snacks').picker.diagnostics()<cr>";
        key = "<leader>sd";
        mode = [ "n" ];
        options.desc = "Diagnostics";
      }
      {
        action = "<cmd>lua require('snacks').picker.diagnostics_buffer()<cr>";
        key = "<leader>sD";
        mode = [ "n" ];
        options.desc = "Buffer Diagnostics";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep()<cr>";
        key = "<leader>sg";
        mode = [ "n" ];
        options.desc = "Grep (Root Dir)";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>sG";
        mode = [ "n" ];
        options.desc = "Grep (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').picker.help()<cr>";
        key = "<leader>sh";
        mode = [ "n" ];
        options.desc = "Help Pages";
      }
      {
        action = "<cmd>lua require('snacks').picker.highlights()<cr>";
        key = "<leader>sH";
        mode = [ "n" ];
        options.desc = "Highlights";
      }
      {
        action = "<cmd>lua require('snacks').picker.icons()<cr>";
        key = "<leader>si";
        mode = [ "n" ];
        options.desc = "Icons";
      }
      {
        action = "<cmd>lua require('snacks').picker.jumps()<cr>";
        key = "<leader>sj";
        mode = [ "n" ];
        options.desc = "Jumps";
      }
      {
        action = "<cmd>lua require('snacks').picker.keymaps()<cr>";
        key = "<leader>sk";
        mode = [ "n" ];
        options.desc = "Keymaps";
      }
      {
        action = "<cmd>lua require('snacks').picker.loclist()<cr>";
        key = "<leader>sl";
        mode = [ "n" ];
        options.desc = "Location List";
      }
      {
        action = "<cmd>lua require('snacks').picker.marks()<cr>";
        key = "<leader>sm";
        mode = [ "n" ];
        options.desc = "Marks";
      }
      {
        action = "<cmd>lua require('snacks').picker.man()<cr>";
        key = "<leader>sM";
        mode = [ "n" ];
        options.desc = "Man Pages";
      }
      {
        action = "<cmd>lua require('snacks').picker.lazy()<cr>";
        key = "<leader>sp";
        mode = [ "n" ];
        options.desc = "Search for Plugin Spec";
      }
      {
        action = "<cmd>lua require('snacks').picker.qflist()<cr>";
        key = "<leader>sq";
        mode = [ "n" ];
        options.desc = "Quickfix List";
      }
      {
        action = "<cmd>lua require('snacks').picker.resume()<cr>";
        key = "<leader>sR";
        mode = [ "n" ];
        options.desc = "Resume";
      }
      {
        action = "<cmd>lua require('snacks').picker.undo()<cr>";
        key = "<leader>su";
        mode = [ "n" ];
        options.desc = "Undotree";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep_word()<cr>";
        key = "<leader>sw";
        mode = [
          "n"
          "x"
        ];
        options.desc = "Visual selection or word (Root Dir)";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep_word({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>sW";
        mode = [
          "n"
          "x"
        ];
        options.desc = "Visual selection or word (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').picker.colorschemes()<cr>";
        key = "<leader>uC";
        mode = [ "n" ];
        options.desc = "Colorschemes";
      }
      {
        action = "<cmd>lua require('snacks').notifier.hide()<cr>";
        key = "<leader>un";
        mode = [ "n" ];
        options.desc = "Dismiss All Notifications";
      }
      {
        action = "<cmd>lua require('snacks').explorer()<cr>";
        key = "<leader>e";
        mode = [ "n" ];
        options.desc = "Explorer Snacks (root dir)";
      }
      {
        action = "<cmd>lua require('snacks').explorer({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>E";
        mode = [ "n" ];
        options.desc = "Explorer Snacks (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').explorer()<cr>";
        key = "<leader>fe";
        mode = [ "n" ];
        options.desc = "Explorer Snacks (root dir)";
      }
      {
        action = "<cmd>lua require('snacks').explorer({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>fE";
        mode = [ "n" ];
        options.desc = "Explorer Snacks (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').picker.smart()<cr>";
        key = "<leader><space>";
        mode = [ "n" ];
        options.desc = "Find Files (Root Dir)";
      }
      {
        action = "<cmd>lua require('snacks').picker.buffers()<cr>";
        key = "<leader>,";
        mode = [ "n" ];
        options.desc = "Buffers";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep()<cr>";
        key = "<leader>/";
        mode = [ "n" ];
        options.desc = "Grep (Root Dir)";
      }
      {
        action = "<cmd>lua require('snacks').picker.command_history()<cr>";
        key = "<leader>:";
        mode = [ "n" ];
        options.desc = "Command History";
      }
      {
        action = "<cmd>lua require('snacks').picker.buffers()<cr>";
        key = "<leader>fb";
        mode = [ "n" ];
        options.desc = "Buffers";
      }
      {
        action = "<cmd>lua require('snacks').picker.buffers({ all = true })<cr>";
        key = "<leader>fB";
        mode = [ "n" ];
        options.desc = "Buffers (all)";
      }
      {
        action = "<cmd>lua require('snacks').picker.files({ cwd = vim.fn.stdpath('config') })<cr>";
        key = "<leader>fc";
        mode = [ "n" ];
        options.desc = "Find Config File";
      }
      {
        action = "<cmd>lua require('snacks').picker.files()<cr>";
        key = "<leader>ff";
        mode = [ "n" ];
        options.desc = "Find Files (Root Dir)";
      }
      {
        action = "<cmd>lua require('snacks').picker.files({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>fF";
        mode = [ "n" ];
        options.desc = "Find Files (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_files()<cr>";
        key = "<leader>fg";
        mode = [ "n" ];
        options.desc = "Find Files (git-files)";
      }
      {
        action = "<cmd>lua require('snacks').picker.projects()<cr>";
        key = "<leader>fp";
        mode = [ "n" ];
        options.desc = "Projects";
      }
      {
        action = "<cmd>lua require('snacks').picker.recent()<cr>";
        key = "<leader>fr";
        mode = [ "n" ];
        options.desc = "Recent";
      }
      {
        action = "<cmd>lua require('snacks').picker.recent({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>fR";
        mode = [ "n" ];
        options.desc = "Recent (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_diff()<cr>";
        key = "<leader>gd";
        mode = [ "n" ];
        options.desc = "Git Diff (hunks)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_diff({ origin = true })<cr>";
        key = "<leader>gD";
        mode = [ "n" ];
        options.desc = "Git Diff (origin)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_issues()<cr>";
        key = "<leader>gi";
        mode = [ "n" ];
        options.desc = "GitHub Issues (open)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_issues({ all = true })<cr>";
        key = "<leader>gI";
        mode = [ "n" ];
        options.desc = "GitHub Issues (all)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_prs()<cr>";
        key = "<leader>gp";
        mode = [ "n" ];
        options.desc = "GitHub Pull Requests (open)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_prs({ all = true })<cr>";
        key = "<leader>gP";
        mode = [ "n" ];
        options.desc = "GitHub Pull Requests (all)";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_status()<cr>";
        key = "<leader>gs";
        mode = [ "n" ];
        options.desc = "Git Status";
      }
      {
        action = "<cmd>lua require('snacks').picker.git_stash()<cr>";
        key = "<leader>gS";
        mode = [ "n" ];
        options.desc = "Git Stash";
      }
      {
        action = "<cmd>lua require('snacks').notifier.show_history()<cr>";
        key = "<leader>n";
        mode = [ "n" ];
        options.desc = "Notification History";
      }
      {
        action = "<cmd>lua require('snacks').picker.registers()<cr>";
        key = "<leader>s\"";
        mode = [ "n" ];
        options.desc = "Registers";
      }
      {
        action = "<cmd>lua require('snacks').picker.search_history()<cr>";
        key = "<leader>s/";
        mode = [ "n" ];
        options.desc = "Search History";
      }
      {
        action = "<cmd>lua require('snacks').picker.autocmds()<cr>";
        key = "<leader>sa";
        mode = [ "n" ];
        options.desc = "Autocmds";
      }
      {
        action = "<cmd>lua require('snacks').picker.lines()<cr>";
        key = "<leader>sb";
        mode = [ "n" ];
        options.desc = "Buffer Lines";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep_buffers()<cr>";
        key = "<leader>sB";
        mode = [ "n" ];
        options.desc = "Grep Open Buffers";
      }
      {
        action = "<cmd>lua require('snacks').picker.command_history()<cr>";
        key = "<leader>sc";
        mode = [ "n" ];
        options.desc = "Command History";
      }
      {
        action = "<cmd>lua require('snacks').picker.commands()<cr>";
        key = "<leader>sC";
        mode = [ "n" ];
        options.desc = "Commands";
      }
      {
        action = "<cmd>lua require('snacks').picker.diagnostics()<cr>";
        key = "<leader>sd";
        mode = [ "n" ];
        options.desc = "Diagnostics";
      }
      {
        action = "<cmd>lua require('snacks').picker.diagnostics_buffer()<cr>";
        key = "<leader>sD";
        mode = [ "n" ];
        options.desc = "Buffer Diagnostics";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep()<cr>";
        key = "<leader>sg";
        mode = [ "n" ];
        options.desc = "Grep (Root Dir)";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>sG";
        mode = [ "n" ];
        options.desc = "Grep (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').picker.help()<cr>";
        key = "<leader>sh";
        mode = [ "n" ];
        options.desc = "Help Pages";
      }
      {
        action = "<cmd>lua require('snacks').picker.highlights()<cr>";
        key = "<leader>sH";
        mode = [ "n" ];
        options.desc = "Highlights";
      }
      {
        action = "<cmd>lua require('snacks').picker.icons()<cr>";
        key = "<leader>si";
        mode = [ "n" ];
        options.desc = "Icons";
      }
      {
        action = "<cmd>lua require('snacks').picker.jumps()<cr>";
        key = "<leader>sj";
        mode = [ "n" ];
        options.desc = "Jumps";
      }
      {
        action = "<cmd>lua require('snacks').picker.keymaps()<cr>";
        key = "<leader>sk";
        mode = [ "n" ];
        options.desc = "Keymaps";
      }
      {
        action = "<cmd>lua require('snacks').picker.loclist()<cr>";
        key = "<leader>sl";
        mode = [ "n" ];
        options.desc = "Location List";
      }
      {
        action = "<cmd>lua require('snacks').picker.marks()<cr>";
        key = "<leader>sm";
        mode = [ "n" ];
        options.desc = "Marks";
      }
      {
        action = "<cmd>lua require('snacks').picker.man()<cr>";
        key = "<leader>sM";
        mode = [ "n" ];
        options.desc = "Man Pages";
      }
      {
        action = "<cmd>lua require('snacks').picker.lazy()<cr>";
        key = "<leader>sp";
        mode = [ "n" ];
        options.desc = "Search for Plugin Spec";
      }
      {
        action = "<cmd>lua require('snacks').picker.qflist()<cr>";
        key = "<leader>sq";
        mode = [ "n" ];
        options.desc = "Quickfix List";
      }
      {
        action = "<cmd>lua require('snacks').picker.resume()<cr>";
        key = "<leader>sR";
        mode = [ "n" ];
        options.desc = "Resume";
      }
      {
        action = "<cmd>lua require('snacks').picker.undo()<cr>";
        key = "<leader>su";
        mode = [ "n" ];
        options.desc = "Undotree";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep_word()<cr>";
        key = "<leader>sw";
        mode = [
          "n"
          "x"
        ];
        options.desc = "Visual selection or word (Root Dir)";
      }
      {
        action = "<cmd>lua require('snacks').picker.grep_word({ cwd = vim.fn.expand('%:p:h') })<cr>";
        key = "<leader>sW";
        mode = [
          "n"
          "x"
        ];
        options.desc = "Visual selection or word (cwd)";
      }
      {
        action = "<cmd>lua require('snacks').picker.colorschemes()<cr>";
        key = "<leader>uC";
        mode = [ "n" ];
        options.desc = "Colorschemes";
      }
    ];
  };
}
