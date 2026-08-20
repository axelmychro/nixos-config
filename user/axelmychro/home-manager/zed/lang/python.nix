{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
    pyright
    ruff
    black
  ];

  programs.zed-editor = {
    # Python support is built-in to Zed!

    userSettings.languages."Python" = {
      language_servers = [
        "pyright"
        "ruff"
      ];

      formatter.external = {
        command = "black";
      };
    };
  };
}
