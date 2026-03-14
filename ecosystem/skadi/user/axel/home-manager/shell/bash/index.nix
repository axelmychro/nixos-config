_: {
  programs.bash = {
    enable = false;
    initExtra = builtins.readFile ./init.sh;
  };
  home.shell.enableBashIntegration = false;
}
