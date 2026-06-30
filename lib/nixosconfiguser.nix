{ lib, ... }:
{
  options.nixosConfigUsers = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        options = {
          name = lib.mkOption { type = lib.types.str; };
          configuration = lib.mkOption { type = lib.types.path; };
        };
      }
    );
    default = { };
  };
}
