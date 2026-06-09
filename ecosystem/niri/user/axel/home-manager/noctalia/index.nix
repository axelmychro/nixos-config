{ noctalia, ... }:
{
  imports = [
    noctalia.homeModules.default
    ./settings/index.nix
  ];
  programs.noctalia.enable = true;
}
