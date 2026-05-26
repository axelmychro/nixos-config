_: {
  programs.fish.shellAliases = {
    x = "sync; clear; exec fish";
    xx = "exit";

    l = "eza -Ahl --group-directories-first --no-permissions --octal-permissions --icons=auto --git";
    c = "cd";
    ".." = "cd ..";
    "..." = "cd ../..";
    mkdir = "mkdir -p";
  };
  imports = [
    ./formatter.nix
  ];
}
