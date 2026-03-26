_: {
  home.shell.enableBashIntegration = true;
  programs.bash = {
    enable = true;

    shellAliases = {
      bb = "exec bash";
      x = "exit";

      wd = "waydroid show-full-ui";
      wdx = "waydroid session stop";
    };
    initExtra = builtins.readFile ./init.bash;
    profileExtra = builtins.readFile ./login.bash;
    logoutExtra = builtins.readFile ./logout.bash;
  };
  imports = [ ./functions/index.nix ];
}
