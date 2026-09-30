{
  config,
  version,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [
      {
        # WARNING: HM is developed against nixos-unstable!
        home.stateVersion = version;
        xdg.portal = {
          enable = config.xdg.portal.enable;
          extraPortals = config.xdg.portal.extraPortals;
        };
      }
    ];
  };
}
