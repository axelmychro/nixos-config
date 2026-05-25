_: {
  programs.fish.shellAliases = {
    x = "sync; clear; exec fish";
    xx = "exit";

    ls = "eza --group-directories-first --no-permissions --octal-permissions --icons=auto --git";
    l = "ls -Ahl";
    c = "cd";
    ".." = "cd ..";
    "..." = "cd ../..";
    mkdir = "mkdir -p";
  };
  imports = [
    ./formatter.nix
  ];
}
