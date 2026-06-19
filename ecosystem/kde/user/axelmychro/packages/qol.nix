{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    eza
    ripgrep
    fd

    btop
    tree
    gdu

    gparted
    #btrfs-progs
  ];
}
