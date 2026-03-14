_: {
  programs.fish.shellAliases = {
    x = "exit";

    wd = "waydroid";
    wds = "waydroid show-full-ui";
    wdx = "waydroid session stop && sudo systemctl stop waydroid-container";

    generate = "nf; and kf; and ga .; and nrsf";
    generate-bleed = "nu; and nf; and kf; and ga .; and nrsf";
    generate-wipe = "nphx; and nsg; and nso; and nf; and kf; and ga .; and nrsf";
  };
}
