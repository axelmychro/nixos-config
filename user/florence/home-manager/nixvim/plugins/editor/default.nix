{
  imports = [ ./trouble.nix ];
  programs.nixvim.plugins = {
    gitsigns.enable = true;
    render-markdown.enable = true;
    todo-comments.enable = true;
    which-key.enable = true;
  };
}
