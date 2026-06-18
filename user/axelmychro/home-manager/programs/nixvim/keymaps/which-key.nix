_: {
  programs.nixvim.keymaps = [
    {
      key = "<c-w><space>";
      options.desc = "Window Hydra Mode (which-key)";
      action = "<cmd>lua require('which-key').show({ keys = '<c-w>', loop = true })<cr>";
      mode = [ "n" ];
    }
    {
      key = "<leader>?";
      options.desc = "Buffer Keymaps (which-key)";
      action = "<cmd>lua require('which-key').show({ global = false })<cr>";
      mode = [ "n" ];
    }
  ];
}
