{
  config,
  ...
}:
{
  nixosConfigUsers.axelmychro = {
    name = "axelmychro";
    configuration = ./default.nix;
  };

  users.users.${config.nixosConfigUsers.axelmychro.name} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG6PBGNhpPnKvAjl2k0oZeY732xawJPcRM/G4yjc+vgR axelmychro@prts"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA3t0YR5cFGKfTOpWZ9MJDf8Av+LstI6A+J+mLbm7lpK axelmychro@prts-web"
    ];
  };
}
