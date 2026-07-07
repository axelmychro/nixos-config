{ noctalia, ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = false;
  };
  imports = [
    noctalia.homeModules.default
    #./settings/index.nix
  ];
}
