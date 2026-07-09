_: {
  programs.bash = {
    enable = true;

    initExtra = builtins.readFile ./bashrc.bash;
    profileExtra = builtins.readFile ./profile.bash;
    logoutExtra = builtins.readFile ./logout.bash;
  };
}
