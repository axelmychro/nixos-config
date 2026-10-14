{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd
    nixfmt
  ];

  programs.zed-editor = {
    extensions = [ "nix" ];

    userSettings.languages."Nix" = {
      language_servers = [ "nixd" ];
      formatter.external.command = "nixfmt";
    };
  };
}
