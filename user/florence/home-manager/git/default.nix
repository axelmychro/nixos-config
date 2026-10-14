{ user, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        inherit (user) email;
        name = "Axel";
      };
      # NOTE:: Codeberg is advanced enough to accept ssh signatures, GitHub is not.
      commit.gpgSign = true;
    };
  };
}
