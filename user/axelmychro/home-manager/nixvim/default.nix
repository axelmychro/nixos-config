_: {
  programs.nixvim.enable = true;

  imports = [
    ./general.nix
    ./keymaps/index.nix
    ./plugins/index.nix
    ./lang/index.nix
  ];
}
