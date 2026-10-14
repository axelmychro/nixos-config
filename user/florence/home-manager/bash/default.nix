{
  pkgs,
  nixpkgs_options,
  ...
}:
{
  programs.bash = {
    enable = nixpkgs_options.user_shell == pkgs.bash;
    profileExtra = builtins.readFile ./profile.bash;
  };
}
