_: {
  programs.bash = {
    enable = false;

    #initExtra = builtins.readFile ./bashrc.bash;
    profileExtra = builtins.readFile ./profile.bash;
    #logoutExtra = builtins.readFile ./logout.bash;
  };
  #imports = [ ./functions/index.nix ];
}
