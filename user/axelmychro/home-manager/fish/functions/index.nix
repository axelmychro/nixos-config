_: {
  programs.fish.shellInit = ''
    ${builtins.readFile ./log.fish}
    ${builtins.readFile ./conserve.fish}
    ${builtins.readFile ./dl.fish}
  '';
}
