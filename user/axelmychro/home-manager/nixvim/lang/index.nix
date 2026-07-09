{ config, ... }: {
  _module.args.grammars = config.programs.nixvim.plugins.treesitter.package.builtGrammars;
  imports = [
    ./shell-scripts.nix
    ./c-language.nix
    ./fish.nix
    ./json.nix
    ./markdown.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
  ];
}
