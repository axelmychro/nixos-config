{ config, ... }: {
  _module.args.grammars = config.programs.nixvim.plugins.treesitter.package.builtGrammars;
  imports = [
    ./c-language.nix
    ./fish.nix
    ./kdl.nix
    ./markdown.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
    ./shell-scripts.nix
    ./sql.nix
    ./toml.nix
    ./web-language.nix
  ];
}
