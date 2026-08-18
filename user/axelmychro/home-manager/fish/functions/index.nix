_: {
  programs.fish.shellInit = ''
    ${builtins.readFile ./log.fish}
    ${builtins.readFile ./conserve-battery.fish}
    ${builtins.readFile ./dl-video.fish}
  '';
}
