{ pkgs, ... }:
{
  home.packages = with pkgs; [
    shfmt
    shellcheck
  ];

  programs.zed-editor.userSettings.languages."Shell Script" = {
    # Shell support is built-in to Zed!

    language_servers = [ "shellcheck" ];

    formatter.external = {
      command = "shfmt";
      arguments = [
        "--posix"
        "--simplify"
        "--binary-next-line"
        "--case-indent"
        "--func-next-line"
        "--"
      ];
    };
  };
}
