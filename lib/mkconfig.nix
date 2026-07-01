{ inputs }:
host:
{
  version ? "26.05",
  assets ? ../assets,

  ## Required
  system,
  users,
  type ? "minimal",

  ## Optional
  gfx ? [ ],
  extraArgs ? { },
  extraModules ? [ ],
}:

let
  userConfigurations = map (u: ../user/${u}) users;
  gfxModules = map (m: ../modules/graphics/${m}.nix) gfx;
in

inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      system
      version
      type
      assets
      ;
  }
  // extraArgs;

  modules = [
    { system.nixos.label = "${type}-${version}"; }
    ../host/${host}

    ../modules/networking
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
  ++ gfxModules
  ++ extraModules;
}
