{ pkgs, grammars, ... }:
{
  home.packages = [
    pkgs.nixfmt
  ];

  programs.nixvim = {
    plugins = {
      nix.enable = true;

      lsp.servers.nixd.enable = true;

      conform-nvim.settings.formatters_by_ft = {
        nix = [ "nixfmt" ];
      };

      treesitter = {
        grammarPackages = with grammars; [ nix ];
      };
    };
  };
}
