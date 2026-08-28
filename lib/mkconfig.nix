{ inputs, ... }:
host:
{
  version,
  system,
  assets ? ../assets,

  ## Required
  ecosystem,
  users,

  ## Optional
  extraArgs ? { },
  extraModules ? [ ],
}:
let
  inherit (inputs.nixpkgs) lib;
  userConfigurations = lib.concatMap (
    u:
    let
      userConfigurationFile = ../user/${u};
      userHomeManagerConfigurationFile = userConfigurationFile + /home-manager;
    in
    [ userConfigurationFile ]
    ++ lib.optionals (ecosystem != "server" && builtins.pathExists userHomeManagerConfigurationFile) [
      userHomeManagerConfigurationFile
    ]
  ) users;

  defaultArgs = {
    inherit
      version
      system
      assets
      inputs
      ;
  };

  ecosystemArgs =
    if ecosystem == "kde" then
      {
        inherit (inputs) plasma-manager;
      }
    else if ecosystem == "niri" then
      {
        inherit (inputs) noctalia;
      }
    else
      { };
in
lib.nixosSystem {
  modules = [
    { system.nixos.label = "${ecosystem}-${version}"; }
    ../host/common.nix
    ../host/${host}
    ./nixosconfiguser.nix
  ]
  ++ userConfigurations
  ++ lib.optionals (ecosystem != "server") [
    inputs.home-manager.nixosModules.default
    ../modules/home-manager
    ../modules/audio
    ../modules/bluetooth
    ../modules/power
    ../modules/graphics
    ../ecosystem/common.nix
  ]
  ++ (
    if ecosystem == "kde" then
      [
        inputs.silentSDDM.nixosModules.default
        ../ecosystem/kde
      ]
    else if ecosystem == "cosmic" then
      [
        ../ecosystem/cosmic
      ]
    else if ecosystem == "gnome" then
      [
        ../ecosystem/gnome
      ]
    else if ecosystem == "niri" then
      [
        inputs.noctalia.nixosModules.default
        ../ecosystem/niri
      ]
    else if ecosystem == "sway" then
      [
        ../ecosystem/sway
      ]
    else
      [ ]
  )
  ++ extraModules;
  specialArgs = defaultArgs // ecosystemArgs // extraArgs;
}
