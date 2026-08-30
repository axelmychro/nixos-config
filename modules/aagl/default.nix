{ inputs, lib, ... }:
let
  enable_aagl = lib.mkDefault true;
in
{
  imports = [ inputs.aagl.nixosModules.default ];
  nix.settings = inputs.aagl.nixConfig; # Set up Cachix

  programs =
    lib.genAttrs
      [
        "anime-games-launcher"
        "anime-game-launcher"
        "honkers-railway-launcher"
        "honkers-launcher"
        "wavey-launcher"
        "sleepy-launcher"
      ]
      (_: {
        enable = enable_aagl;
      });
}
