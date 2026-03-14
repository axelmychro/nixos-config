_: {
  imports = [ ./functions/index.nix ];
  programs.bash = {
    shellAliases = {
      bb = "exec bash";
      x = "exit";

      wd = "waydroid show-full-ui";
      wdx = "waydroid session stop";
    };
    initExtra = builtins.readFile ./init.sh;
  };
}
