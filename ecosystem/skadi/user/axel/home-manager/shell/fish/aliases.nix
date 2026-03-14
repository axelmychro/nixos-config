_: {
  programs.fish.shellAliases = {
    x = "exit";

    wd = "waydroid";
    wds = "waydroid show-full-ui";
    wdx = "waydroid session stop && sudo systemctl stop waydroid-container";
  };
}
