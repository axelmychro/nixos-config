{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #vim
    #nodejs
    #pnpm

    #godot
  ];
}
