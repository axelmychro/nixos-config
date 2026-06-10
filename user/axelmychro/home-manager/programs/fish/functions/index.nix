_: {
  programs.fish.shellInit = ''
    ${builtins.readFile ./log.fish}
    ${builtins.readFile ./conserve.fish}
    ${builtins.readFile ./kya.fish}
    ${builtins.readFile ./mount-git.fish}
    ${builtins.readFile ./dl.fish}
  '';
}
