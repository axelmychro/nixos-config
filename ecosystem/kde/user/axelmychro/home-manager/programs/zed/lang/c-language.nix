{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    clang-tools
  ];

  programs.zed-editor = {
    # C and C++ support is built-in to Zed!

    userSettings.languages = {
      "C" = {
        language_servers = [ "clangd" ];
        formatter.external.command = "clang-format";
      };

      "C++" = {
        language_servers = [ "clangd" ];
        formatter.external.command = "clang-format";
      };
    };
  };
}
