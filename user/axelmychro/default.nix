{
  users,
  ...
}:
let
  them = users.axelmychro.username;
in
{
  users.users.${them} = {
    isNormalUser = true;
    extraGroups = [
      "video"
      "render"
      "wheel"
      "docker"
      "libvirtd"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG6PBGNhpPnKvAjl2k0oZeY732xawJPcRM/G4yjc+vgR axelmychro@prts"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMG2joyLqVw/DLRWmlRm2yXCXAMTQYJKqrxzKazhERxv axelmychro@prts-web"
    ];
  };
}
