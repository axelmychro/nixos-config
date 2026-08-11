_: {
  programs.fish.shellInit = ''
    ${builtins.readFile ./log.fish}
    ${builtins.readFile ./battery-conserve.fish}
    ${builtins.readFile ./dl-video.fish}
  '';
}
