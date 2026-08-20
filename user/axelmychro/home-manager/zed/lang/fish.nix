{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fish-lsp
  ];

  programs.zed-editor = {
    extensions = [ "fish" ];

    userSettings.languages."Fish" = {
      language_servers = [ "fish-lsp" ];

      formatter.external = {
        command = "fish_indent";
      };
    };
  };
}
