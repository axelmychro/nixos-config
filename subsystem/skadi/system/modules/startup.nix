{
  pkgs,
  skadiAssets,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.cage}/bin/cage -sd -- ${pkgs.greetd.regreet}/bin/regreet";
        user = "greeter";
      };
    };
  };
  users.users.greeter.extraGroups = [
    "video"
    "render"
  ];
  programs.regreet = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    font = {
      package = pkgs.nerd-fonts.geist-mono;
      name = "GeistMono Nerd Font";
      size = 16;
    };
  };
}
