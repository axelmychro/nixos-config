{
  pkgs,
  noctalia,
  ...
}:
{
  services.desktopManager.plasma6.enable = true;

  imports = [ ./user/index.nix ];
}
