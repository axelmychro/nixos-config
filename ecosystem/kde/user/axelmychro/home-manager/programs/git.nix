_: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Axel";
        email = "axelmychro@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      alias = {
        s = "status";
        r = "remote -v";
        l = "log --oneline";
        co = "checkout";
        f = "fetch";
        sh = "stash";
        pl = "pull";
        ph = "push";
      };
    };
  };
}
