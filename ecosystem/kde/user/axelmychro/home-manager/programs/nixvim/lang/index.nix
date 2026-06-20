{ config, ... }: {
  _module.args.grammars = config.programs.nixvim.plugins.treesitter.package.builtGrammars;
  imports = [
    ./shell-scripts.nix
    ./c-many.nix
    ./fish.nix
    ./json.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
  ];
}
