{ pkgs, grammars, ... }:
{
  programs.nixvim = {
    plugins = {
      nix.enable = true;
      lsp.servers.nixd.enable = true;
      conform-nvim.settings.formatters_by_ft = {
        nix = [ "nixfmt" ];
      };
      treesitter.grammarPackages = with grammars; [
        nix
      ];
    };
    extraPackages = with pkgs; [
      nixfmt
    ];
  };
}
