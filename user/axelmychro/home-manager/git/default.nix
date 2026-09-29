{ user, ... }: {
  programs.git = {
    enable = true;
    settings.user = {
      name = "Axel";
      inherit (user) email;
    };
  };
}
