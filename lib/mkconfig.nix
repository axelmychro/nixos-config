{ inputs }:
host:
{
  version ? "26.05",
  assets ? ../assets,

  ## Required
  users,

  ## Optional
  system ? "x86_64-linux",
  type ? "minimal",
  ecosystem ? "",

  extraArgs ? { },
  extraModules ? [ ],
}:

let
  userConfigurations = inputs.nixpkgs.lib.concatMap (
    u:
    [ ../user/${u} ]
    ++ (
      if builtins.pathExists (../user + "/${u}" + /home-manager) then
        [ (../user + "/${u}" + /home-manager) ]
      else
        [ ]
    )
  ) users;

  defaultArgs = {
    inherit
      version
      system
      assets
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

inputs.nixpkgs.lib.nixosSystem {
  specialArgs = defaultArgs // ecosystemArgs // extraArgs;

  modules = [
    { system.nixos.label = "${type}-${version}"; }
    ../host/${host}
    ./nixosconfiguser.nix
  ]
  ++ userConfigurations
  ++ (
    if type == "minimal" then
      [ ]
    else if type == "desktop" then
      [
        inputs.home-manager.nixosModules.default
        ../modules/home-manager

        ../modules/audio
        ../modules/bluetooth

        ../modules/graphics
      ]
    else if type == "laptop" then
      [
        inputs.home-manager.nixosModules.default
        ../modules/home-manager

        ../modules/audio
        ../modules/bluetooth
        ../modules/power

        ../modules/graphics
      ]
    else if type == "server" then
      [ ]
    else
      [ ]
  )
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
    else
      [ ]
  )
  ++ extraModules;
}
